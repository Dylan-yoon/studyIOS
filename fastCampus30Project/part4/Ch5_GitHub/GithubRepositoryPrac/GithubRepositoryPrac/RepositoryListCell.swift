//
//  RepositoryListCell.swift
//  GithubRepositoryPrac
//
//  Created by 윤병희 on 2022/02/21.
//

import UIKit
import SnapKit

class RepositoryListCell : UITableViewCell {
    var repository: Repository?
    
    let nameLabel = UILabel()
    let descriptionLable = UILabel()
    let starImageView = UIImageView()
    let starLabel = UILabel()
    let languageLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [
            nameLabel, descriptionLable, starImageView, starLabel, languageLabel
        ].forEach{
            contentView.addSubview($0)
        }
        
        
        guard let repository = repository else { return }
        nameLabel.text = repository.name
        nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        descriptionLable.text = repository.description
        descriptionLable.font = .systemFont(ofSize: 15)
        descriptionLable.numberOfLines = 2
        
        starImageView.image = UIImage(systemName : "star")
        
        starLabel.text = "\(repository.stargazersCount)"
        starLabel.font = .systemFont(ofSize: 16)
        starLabel.textColor = .gray
        
        languageLabel.text = repository.language
        languageLabel.font = .systemFont(ofSize: 16)
        languageLabel.textColor = .gray
        
        nameLabel.snp.makeConstraints{
            $0.top.trailing.leading.equalToSuperview().inset(18)
        }
        
        descriptionLable.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.trailing.equalTo(nameLabel)
        }
        
        starImageView.snp.makeConstraints {
            $0.top.equalTo(descriptionLable.snp.bottom).offset(18)
            $0.leading.equalTo(descriptionLable)
            $0.width.height.equalTo(20)
            $0.bottom.equalToSuperview().inset(18)
        }
        starLabel.snp.makeConstraints {
            $0.centerY.equalTo(starImageView)
            $0.leading.equalTo(starImageView.snp.trailing).offset(5)
        }
        
        languageLabel.snp.makeConstraints {
            $0.centerY.equalTo(starLabel)
            $0.leading.equalTo(starLabel.snp.trailing).offset(12)
        }
    }
}

