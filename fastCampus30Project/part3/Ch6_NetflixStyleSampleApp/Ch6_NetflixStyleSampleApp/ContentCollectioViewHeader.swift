//
//  ContentCollectioViewHeader.swift
//  Ch6_NetflixStyleSampleApp
//
//  Created by 윤병희 on 2022/01/18.
//

import UIKit

class ContentCollectionViewHeader : UICollectionReusableView {
    let sectionNameLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        sectionNameLabel.font = .systemFont(ofSize: 17 , weight: .bold)
        sectionNameLabel.textColor = .white
        sectionNameLabel.sizeToFit()
        
        addSubview(sectionNameLabel)
        
        sectionNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.bottom.leading.equalToSuperview().offset(10)
        }
        
    }
}
