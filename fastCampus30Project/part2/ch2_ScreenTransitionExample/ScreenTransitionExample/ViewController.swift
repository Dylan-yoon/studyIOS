//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 윤병희 on 2021/11/02.
//

import UIKit

class ViewController: UIViewController, SendDateDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController, View loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController, View will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController, View did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController, View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController, View did disappear")
    }
    

    
    
    
    
    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else {return}
        viewController.modalPresentationStyle = .fullScreen
        viewController.name = "dylan"
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func tapCodePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController else {return}
        viewController.name = "dyaln"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    func sendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

