//
//  ViewController.swift
//  randomcode_applyCh1
//
//  Created by 윤병희 on 2021/10/31.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var codeTypeLabel: UILabel!
    @IBOutlet weak var codeNameLabel: UILabel!
    @IBOutlet weak var usingLabel: UILabel!
    
//

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func originCodeBtn(_ sender: UIButton) {
        let random1 = Int(arc4random_uniform(5))
        let origincode = originCodes[random1]
        self.codeNameLabel.text = origincode.codeName
        self.usingLabel.text = origincode.codeUsing
        self.codeTypeLabel.text = "Terminal Code"
    }
    @IBAction func githubCodeBtn(_ sender: UIButton) {
        let random2 = Int(arc4random_uniform(2))
        let githubcode = githubCodes[random2]
        self.codeNameLabel.text = githubcode.codeName
        self.usingLabel.text = githubcode.codeUsing
        self.codeTypeLabel.text = "Github Code"
    }
}



