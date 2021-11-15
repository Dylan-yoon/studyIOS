//
//  ViewController.swift
//  ch6_pomodoro
//
//  Created by 윤병희 on 2021/11/15.
//

import UIKit

enum TimerStatus {
    case start
    case pasue
    case end
}

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var cancleBtn: UIButton!
    @IBOutlet weak var toggleBtn: UIButton!
    
    var duration = 60 //타이머 초기값
    var timerStatus: TimerStatus = .end
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setTimerInfoViewVisble(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
        
    }


    @IBAction func tapCancleBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func tapToggleBtn(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        switch self.timerStatus {
        case .end:
            self.timerStatus = .start
            self.setTimerInfoViewVisble(isHidden: false)
            self.datePicker.isHidden = true
            
        case .start:
            self.timerStatus = .pasue
            
        default:
            break
        }
    }
}

