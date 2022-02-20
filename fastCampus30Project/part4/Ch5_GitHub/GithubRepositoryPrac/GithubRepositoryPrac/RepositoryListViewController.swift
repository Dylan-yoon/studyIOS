//
//  RepositoryListViewController.swift
//  GithubRepositoryPrac
//
//  Created by 윤병희 on 2022/02/20.
//

import UIKit

class RepositoryListViewController : UITableViewController {
    private let organization = "Apple"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = organization + "Repositories"
        
        self.refreshControl = UIRefreshControl() //당겨서 새로고침
        let refreshController = self.refreshControl!
        refreshController.backgroundColor = .white
        refreshController.tintColor = .darkGray
        refreshController.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        tableView.register(RepositoryListCell.self, forCellReuseIdentifier: "RepositoryListCell")
        tableView.rowHeight = 140
    }
    
    @objc func refresh() {
        
    }
}

//UITableView DataSource Delegate

extension RepositoryListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryListCell", for: indexPath) as? RepositoryListCell else { return UITableViewCell() }
        
        return cell
    }
}
