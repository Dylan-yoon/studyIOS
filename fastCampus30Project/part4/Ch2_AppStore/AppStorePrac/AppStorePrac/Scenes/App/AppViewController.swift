//
//  AppViewController.swift
//  AppStorePrac
//
//  Created by 윤병희 on 2022/02/08.
//

import Foundation
import UIKit
import SnapKit

final class AppViewController: UIViewController {
    
    
    /*
     2번째 탭바에서 구현할 것들...
     
     */
    
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical //스텍뷰가 세로로
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0 //서브뷰가 알아서 높이 정한다.
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = UIView()
        let exchangecodeButtonView = UIView()
        
        featureSectionView.backgroundColor = .red
        rankingFeatureSectionView.backgroundColor = .green
        exchangecodeButtonView.backgroundColor = .blue
        
        [
        featureSectionView,
        rankingFeatureSectionView,
        exchangecodeButtonView
        ].forEach {
            stackView.addArrangedSubview($0)
            
        }
        
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
    }
}


private extension AppViewController {
    func setupNavigationController() {
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
    }
}
