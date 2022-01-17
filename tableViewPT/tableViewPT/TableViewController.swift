//
//  TableViewController.swift
//  tableViewPT
//
//  Created by 윤병희 on 2022/01/10.
//

import UIKit

class TableViewController: UITableViewController {

    let button: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXIB()
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc
    func buttonAction() {
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") else { return UITableViewCell() }
        
        
    
//                cell.nameLabel.text = "민수"
//                cell.ageLabel.text = "11"
                
        return cell
    }

    private func registerXIB() {
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "TableViewCell")
        
    }

}
