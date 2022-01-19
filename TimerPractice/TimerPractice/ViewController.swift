//
//  ViewController.swift
//  TimerPractice
//
//  Created by 윤병희 on 2022/01/16.
//

import UIKit

class ViewController: UIViewController {
    
    var maintimer:Timer?
    var timercount : Double = 0

    
    
    
    

    @IBOutlet weak var timerLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func startBtn(_ sender: UIButton) {
        
        self.maintimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        

    }
    
    @objc func fireTimer() {
        self.timercount += 0.1
        self.timerLabel.text = String(round(timercount*1000)/1000)
        
        
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        
        self.maintimer?.invalidate()
        self.maintimer = nil
    }
    
}

