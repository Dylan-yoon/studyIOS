//
//  ProfileCollectionViewCell.swift
//  Ch4_OutStargram
//
//  Created by 윤병희 on 2022/02/13.
//

import UIKit
import SnapKit

class ProfileCollectionViewCell : UICollectionViewCell {
    private let imageView = UIImageView()
    
    func setup(with
               image: UIImage) {
        addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        imageView.backgroundColor = .tertiaryLabel
    }
    
    
}
