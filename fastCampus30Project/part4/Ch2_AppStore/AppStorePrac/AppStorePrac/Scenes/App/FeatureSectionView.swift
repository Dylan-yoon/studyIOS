//
//  FeatureSectionView.swift
//  AppStorePrac
//
//  Created by 윤병희 on 2022/02/08.
//






import SnapKit
import UIKit

final class FeatureSectionView: UIView {
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false //스크롤바 감추기
        
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "FeatureSectionCollectionViewCell"
        )
        
        return collectionView
    }()
    
    
    
    //보통의 경우 viewdidroad에서 구현하지만
    //UIView 이기 때문에 init으로 오버라이드 한다
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension FeatureSectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureSectionCollectionViewCell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
}

extension FeatureSectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 32.0 , height: frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        32.0
    }
}


private extension FeatureSectionView {
    func setupViews() {
        [
            collectionView
        ].forEach {addSubview($0)}
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(16.0)
            $0.height.equalTo(snp.width)
            $0.bottom.equalToSuperview()
        }
    }
}
