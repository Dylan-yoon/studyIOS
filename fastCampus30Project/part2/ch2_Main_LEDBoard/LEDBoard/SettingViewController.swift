//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by 윤병희 on 2021/11/03.
//

import UIKit

protocol LEDBoardSettingDelegate :AnyObject{
    func  changedSetting(text: String?, textColor: UIColor, backgroundColor : UIColor)
}
    //MARK: - OutLet
class SettingViewController: UIViewController {
    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var orangeBtn: UIButton!
    
    
    
    weak var delegate : LEDBoardSettingDelegate?
    var ledText : String?
    var textColor : UIColor = .yellow //textcolor를 노란색으로 초기화
    var backgroundColor : UIColor = .black // background컬러를 검정색으로 초기화
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    
    private func configureView() {
        if let ledText = self.ledText {
            self.textFiled.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColorBtn(color: self.backgroundColor)
    }
    
    
    //MARK: -Action
    
    @IBAction func tapTextColorBtn(_ sender: UIButton) {
        if sender == self.yellowBtn {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleBtn {
            self.changeTextColor(color: .purple)
            self.textColor = . purple
        } else {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    @IBAction func tapBackgroundColorBtn(_ sender: UIButton) {
        if sender == self.blackBtn{
            self.changeBackgroundColorBtn(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blueBtn{
            self.changeBackgroundColorBtn(color: .blue)
            self.backgroundColor = .blue
        } else {
            self.changeBackgroundColorBtn(color: .orange)
            self.backgroundColor = .orange
        }
    }
    @IBAction func tapSaveBtn(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: self.textFiled.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor
        )
        self.navigationController?.popViewController(animated: true)    //저장 누르면 이전화면으로 돌아가는 popViewContrrrrrr
    }
    
    private func changeTextColor(color: UIColor) {
        self.yellowBtn.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleBtn.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenBtn.alpha = color ==  UIColor.green ? 1 : 0.2
    }
    private func changeBackgroundColorBtn(color: UIColor) {
        self.blackBtn.alpha = color == UIColor.black ? 1 : 0.2
        self.blueBtn.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeBtn.alpha = color == UIColor.orange ? 1 : 0.2
    }
    
}

