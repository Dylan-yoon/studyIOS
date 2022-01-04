//
//  LoginViewController.swift
//  ch1_SpotifyLoginSampleApp
//
//  Created by 윤병희 on 2021/12/23.
//

import UIKit
import GoogleSignIn

class LoginViewController : UIViewController {
    @IBOutlet weak var emailLoginBtn: UIButton!
    @IBOutlet weak var googleLoginBtn: GIDSignInButton! //UI버튼을 상속하기 때문에 아래 버튼 속성의 변경에도 오류나지않는다.
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
        
        //Google Sign IN
//        GIDSignIn.sharedInstance.presentingViewController = self //오류 Value of type 'GIDSignIn' has no member 'presentingViewController'
        
    }
    
    
    
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        //Firebase 인증

        GIDSignIn.sharedInstance.signIn(with: <#T##GIDConfiguration#>, presenting: <#T##UIViewController#>, callback: <#T##GIDSignInCallback?##GIDSignInCallback?##(GIDGoogleUser?, Error?) -> Void#>)
        
    }
    
    
    
    
    
    
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        //Firebase 인증
    }
    
}
