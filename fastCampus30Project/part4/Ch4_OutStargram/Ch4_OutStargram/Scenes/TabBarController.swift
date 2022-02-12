//
//  TabBarController.swift
//  Ch4_OutStargram
//
//  Created by 윤병희 on 2022/02/12.
//

import UIKit

final class TabBarController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        feedViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        
        let profileViewController = UIViewController()
        profileViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        
        
        //viewControllers는 UITabBarController의 변수.. 탭바에 추가하기위해
        viewControllers = [feedViewController, profileViewController]
    }
    
}

