//
//  SuguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 윤병희 on 2021/11/02.
//

import UIKit

class SuguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
}
