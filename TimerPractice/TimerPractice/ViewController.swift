//
//  ViewController.swift
//  TimerPractice
//
//  Created by 윤병희 on 2022/01/16.
//

import UIKit

class ViewController: UIViewController {
    
    var mainTimer:Timer?
    var timercount = 0

    @IBOutlet weak var timerLabel: UITextField!
    
//    var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
//

    
    
//    var timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: timer in
//    print("FIRE!!")
//    )
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func startBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func stopBtn(_ sender: UIButton) {
    }
    
    
    func starting() {
        
    }
    
    
//
//    @objc func update() {
//        timerLabel.text = String(count)
//        count = count + 1
//    }
}

