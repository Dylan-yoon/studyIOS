//
//  ViewController.swift
//  LEDBoard
//
//  Created by 윤병희 on 2021/11/03.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

    
    @IBOutlet weak var contentsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentsLabel.text
            settingViewController.textColor = self.contentsLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }//세그웨이로 화면구현했기때문에 prepare메서드 구현
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }

}

