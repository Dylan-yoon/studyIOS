//
//  RepositoryListCell.swift
//  GithubRepositoryPrac
//
//  Created by 윤병희 on 2022/02/21.
//

import UIKit
import SnapKit

class RepositoryListCell : UITableViewCell {
    var repository: String?
    
    let nameLabel = UILabel()
    let descriptionLable = UILabel()
    let starImageView = UIImageView()
    let starLabel = UILabel()
    let languageLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [
            nameLabel, descriptionLable, starImageView, starLabel,languageLabel
        ].forEach{
            contentView.addSubview($0)
        }
    }
    
    
    
}

