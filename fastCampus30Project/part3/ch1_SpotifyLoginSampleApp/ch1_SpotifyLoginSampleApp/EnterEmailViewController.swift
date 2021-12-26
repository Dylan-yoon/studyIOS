//
//  EnterEmailViewController.swift
//  ch1_SpotifyLoginSampleApp
//
//  Created by 윤병희 on 2021/12/26.
//

import UIKit

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
