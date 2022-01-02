//
//  EnterEmailViewController.swift
//  ch1_SpotifyLoginSampleApp
//
//  Created by 윤병희 on 2021/12/26.
//

import UIKit
import Firebase

class EnterEmailViewController: UIViewController{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 30
        nextButton.isEnabled = false
        
        emailTextField.delegate = self
        passwordTextFiled.delegate = self
        
        emailTextField.becomeFirstResponder()// 화면을 켰을 때 바로 커서가 텍스트 필드에 위치하도록 해주는 메서드
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Navigatio nBar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    
    @IBAction func nextbuttonTapped(_ sender: UIButton) {
        //firebase 이메일/비밀번호 인증
        let email = emailTextField.text ?? ""
        let password = passwordTextFiled.text ?? ""
        
        //신규 사용자 생성
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, Error in
            guard let self = self else { return }
            
            self.showMainViewController()
        }
        
    }
    
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
}

extension EnterEmailViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }//Textfield 가 리턴(enter) 되었을 때 키보트를 없애준다
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextFiled.text == ""
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    } //isEmailEmpty와 isPasswordEmpty가 빈칸이 아닐 때 nextbutton 활성화
}



