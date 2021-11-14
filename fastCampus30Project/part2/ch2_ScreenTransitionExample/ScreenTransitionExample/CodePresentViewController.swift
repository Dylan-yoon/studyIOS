//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 윤병희 on 2021/11/02.
//

import UIKit

protocol SendDateDelegate: AnyObject {
    func sendData(name : String)
}

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.delegate?.sendData(name: "dylan")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var nameLabel: UILabel!
    var name : String?
    weak var delegate : SendDateDelegate?
    
}

