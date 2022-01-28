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
        var age : Int
    }
    
    var nameAge = [NameAge]()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXIB()
    }
    
    
    
    
    
    @IBAction func addInfo(_ sender: UIBarButtonItem) {
        let informations = self.nameAge
        
        let alert = UIAlertController(title: "RegistInfo", message: nil, preferredStyle: .alert)
        let nameRegistBtn = UIAlertAction(title: "d", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let name = 
            
        })
        
        
        
        
//        let registerButton = UIAlertAction(title: "Register", style: .default, handler: { [weak self] _ in      //alert에 버튼이 추가되게 만든다.
//             guard let title = alert.textFields?[0].text else { return }                                         //alert.textFields?[0].text 를 가드문으로
//             let task = Task(title: title, done: false)
//             self?.tasks.append(task)                //tasks 배열에 append(추가)
//             self?.tableView.reloadData()
//         })
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
