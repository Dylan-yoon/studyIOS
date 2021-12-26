//
//  LoginViewController.swift
//  ch1_SpotifyLoginSampleApp
//
//  Created by 윤병희 on 2021/12/23.
//

import UIKit

class LoginViewController : UIViewController {
    @IBOutlet weak var emailLoginBtn: UIButton!
    @IBOutlet weak var googleLoginBtn: UIButton!
    @IBOutlet weak var appleLoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginBtn, googleLoginBtn, appleLoginBtn].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //Navigatiion Bar 숨기기
        navigationController?.navigationBar.isHidden = true
        
        
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        //Firebase 인증
    }
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        //Firebase 인증
    }
    
}
