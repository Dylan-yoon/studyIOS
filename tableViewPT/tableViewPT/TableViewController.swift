//
//  TableViewController.swift
//  tableViewPT
//
//  Created by 윤병희 on 2022/01/10.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    struct NameAge {
        var name : String
        var age : String
    }
    
    var nameAge = [NameAge]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXIB()
    }
    
    
    
    @IBAction func addInfo(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "RegistInfo", message: nil, preferredStyle: .alert)
        let nameRegistBtn = UIAlertAction(title: "d", style: .default, handler: { [weak self] _ in
            guard let nametitle = alert.textFields?[0].text else { return } //
            guard let agetitle = alert.textFields?[1].text else { return }
            let name = NameAge(name: nametitle, age: agetitle)
            self?.nameAge.append(name)
            self?.tableView.reloadData()
        })
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(nameRegistBtn)
        alert.addAction(cancelBtn)
        
        alert.addTextField(configurationHandler: {textField in
            textField.placeholder = "이름"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "나이"
        })
        
        self.present(alert, animated: true, completion: nil
        )
        
        
//        let registerButton = UIAlertAction(title: "Register", style: .default, handler: { [weak self] _ in      //alert에 버튼이 추가되게 만든다.
//             guard let title = alert.textFields?[0].text else { return }                                         //alert.textFields?[0].text 를 가드문으로
//             let task = Task(title: title, done: false)
//             self?.tasks.append(task)                //tasks 배열에 append(추가)
//             self?.tableView.reloadData()
//         })
        
//        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)                 //alert에 취소버튼 추가되게 만든다.
//        let emptybtn = UIAlertAction(title: "empty", style: .default, handler: nil)
//        //위에 상수를 생성 해놓고 alert.addAction 으로 버튼 생성한다.
//        alert.addAction(cancelButton)   //취소버튼생성
//        alert.addAction(registerButton) //저장 버튼 생성
//        alert.addAction(emptybtn)
//        alert.addTextField(configurationHandler: { textField in                                 //텍스트Field 생성
//            textField.placeholder = "할 일을 입력해주세요."
//        })
//        self.present(alert, animated: true, completion: nil)
//
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") else { return UITableViewCell() }
        
        
                
        return cell
    }

    private func registerXIB() {
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "TableViewCell")
        
    }

}
