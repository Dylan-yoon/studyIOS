//
//  MainViewcontroller.swift
//  ch1_SpotifyLoginSampleApp
//
//  Created by 윤병희 on 2021/12/26.
//

import UIKit
import Firebase

class MainViewController : UIViewController {
    @IBOutlet weak var welcomeLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        
        let email = Auth.auth().currentUser?.email ?? "고객"
        
        welcomeLable.text = """
        환영합니다.
        \(email)님
        """
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

