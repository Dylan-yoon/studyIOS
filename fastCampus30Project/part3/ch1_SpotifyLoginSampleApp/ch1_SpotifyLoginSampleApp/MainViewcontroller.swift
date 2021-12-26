//
//  MainViewcontroller.swift
//  ch1_SpotifyLoginSampleApp
//
//  Created by 윤병희 on 2021/12/26.
//

import UIKit

class MainViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
 
