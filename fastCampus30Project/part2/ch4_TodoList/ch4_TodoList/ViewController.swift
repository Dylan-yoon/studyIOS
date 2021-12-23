//
//  ViewController.swift
//  ch4_TodoList
//
//  Created by 윤병희 on 2021/11/06.
//

import UIKit



class ViewController: UIViewController {
    //MARK: - Outlet 지정 및 override
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!           //strong 하는이유 :
    var doneButton : UIBarButtonItem?
    var tasks = [Task]() {                              //할 일 들을 저장하는 배열 생성
        didSet {
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap)) //@objc 오브젝트-c 와의 호환성을 위해
        self.tableView.dataSource = self // 이 구문 쓰지 않는다면 add. 버튼 누르고 할일 등록해도 등록되지않는다.
        self.tableView.delegate = self //Cannot assign value of type "ViewController' to type 'UITableViewDelegate?'
        self.loadTasks()
    }
    
    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
    }
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
        
    }
    
    //MARK: - Add버튼을 눌렀을때 UIAlertController를 사용해 list 생성
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)                  //actionSheet 할 때 런타임 오류
        let registerButton = UIAlertAction(title: "Register", style: .default, handler: { [weak self] _ in      //alert에 버튼이 추가되게 만든다.
            guard let title = alert.textFields?[0].text else { return }                                         //alert.textFields?[0].text 를 가드문으로
            let task = Task(title: title, done: false)
            self?.tasks.append(task)                //tasks 배열에 append(추가)
            self?.tableView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)                 //alert에 취소버튼 추가되게 만든다.
        let emptybtn = UIAlertAction(title: "empty", style: .default, handler: nil)
        //위에 상수를 생성 해놓고 alert.addAction 으로 버튼 생성한다.
        alert.addAction(cancelButton)   //취소버튼생성
        alert.addAction(registerButton) //저장 버튼 생성
        alert.addAction(emptybtn)
        alert.addTextField(configurationHandler: { textField in                                 //텍스트Field 생성
            textField.placeholder = "할 일을 입력해주세요."
        })
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    //MARK: - 앱 종료후 실행시에도 저장되게 만들기
    //MARK: 할일저장
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "done" : $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    //MARK: 저장된 데이터(할 일) 로드
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        if task.done{
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.tasks.isEmpty {
            self.doneButtonTap()
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {         //didSelectRowAt  해당 줄이 선택 될 때...(체크박스설정을 위해)
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)            //테이블 뷰에 reload
        
    }
    
}

