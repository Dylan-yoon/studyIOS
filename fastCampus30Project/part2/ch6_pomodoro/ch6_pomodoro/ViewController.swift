//
//  ViewController.swift
//  ch6_pomodoro
//
//  Created by 윤병희 on 2021/11/15.
//

import UIKit
import AudioToolbox


enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var toggleBtn: UIButton!
    
    var duration = 60 //타이머 초기값
    var timerStatus: TimerStatus = .end         //앱 실행시 최초 timerstatus를 초기상태인 end로 설정
    var timer: DispatchSourceTimer?
    var currentSeconds = 0              //현재 카운트다운되고있는 시간을 초로 저장하는 프로퍼티
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleBtn()
    }
    
    func setTimerInfoViewVisble(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
        
    }
    
    //MARK: DispatchSourceTimer 사용하는방법
    func startTimer() { //이 메서드에서 타이머가 시작되고 멈추는걸 구현
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            self.timer?.schedule(deadline: .now(), repeating: 1)
            //deadline:.now()즉시 시작, 3초뒤 하고싶으면 .now() +3
            //repeating: 몇초마다 반복할건가?
            self.timer?.setEventHandler(handler: { [weak self] in
                guard let self = self else { return }
                self.currentSeconds -= 1 //시간 카운트 다운
                debugPrint(self.currentSeconds)
                let hour = self.currentSeconds / 3600
                let minites = (self.currentSeconds % 3600) / 60
                let seconds = (self.currentSeconds % 3600) % 60
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minites, seconds) // 이 구문써야 옵셔널 오류 사라짐
                self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
                UIView.animate(withDuration: 0.5, delay: 0, animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
                })
                UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi * 2)
                })
                
                
                
                
                if self.currentSeconds <= 0 {    //currentSeconds가 nil이면 0 , 0보다 작으면 ~
                    self.stopTimer()
                    AudioServicesPlaySystemSound(1005) //iphonedev.wiki 에서 확인가능 0이 될때 알람음을 설정
                    
                }
            })
            self.timer?.resume() //타이머 시작되게한다.
        }
        
    }
    
    func stopTimer() {
        if self.timerStatus == .pause {             // <<--
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.cancelBtn.isEnabled = false //취소버튼 비활성화
        
        //여기에서도 UIVeiw를 이용해 애니메이션 설정을 위해 다시 설정한다
//        self.setTimerInfoViewVisble(isHidden: true)
//        self.datePicker.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.timerLabel.alpha = 0
            self.progressView.alpha = 0
            self.datePicker.alpha = 1
            self.imageView.transform = .identity
        })
        self.toggleBtn.isSelected = false
        
        
        self.timer?.cancel()
        self.timer = nil
        //공식문서에서 suspend로 멈추게 되면 timer 중지하고 nil이 되게 하려면 다시 resume 메서드 호출해야한다.// <<--
    }
    
    
    // 버튼의 상태에 따라 타이틀 변경되게 구현
    func configureToggleBtn() {
        self.toggleBtn.setTitle("시작", for: .normal)         //normal상태면 시작으로
        self.toggleBtn.setTitle("일시정지", for: .selected)     //selected상태면 일시정지로
    }

    @IBAction func tapCancelBtn(_ sender: UIButton) {
        switch self.timerStatus{
        case .start, .pause:
//                    self.timerStatus = .end
//                    self.cancelBtn.isEnabled = false //취소버튼 비활성화
//                    self.setTimerInfoViewVisble(isHidden: true)
//        //            self.progressView.isHidden = true
//        //            self.timerLabel.isHidden = false
//        //이 위에 두개를 setTimerInfoViewVisble이 대신한다
//                    self.datePicker.isHidden = false
//                    self.toggleBtn.isSelected = false
//위 식들이 stopTimer()에 넣어주어 타이머가 멈출때 같은 역할을 하게한다.
            self.stopTimer()
            
        default:
            break
        }
        
        
    
        self.duration = Int(self.datePicker.countDownDuration)
        
    }
    
    
    
    
    
    @IBAction func tapToggleBtn(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        switch self.timerStatus {
        case .end:                                  //타이머 상태가 end이면
            self.currentSeconds = self.duration
            self.timerStatus = .start                           //start로 변경
            
            //애니메이션 설정을 위해 아래 두개 지우고
//            self.setTimerInfoViewVisble(isHidden: false)        //타임레이블과 progreesview 숨김(isHidden)
//            self.datePicker.isHidden = true                     //datePicker숨김
            UIView.animate(withDuration: 0.5, animations: {
                self.timerLabel.alpha = 1
                self.progressView.alpha = 1
                self.datePicker.alpha = 0
            })
        
            self.toggleBtn.isSelected = true                    //
            self.cancelBtn.isEnabled = true
            self.startTimer()
            
            
        case .start:
            self.timerStatus = .pause
            self.toggleBtn.isSelected = false
            self.timer?.suspend()
            
        case .pause:
            self.timerStatus = .start
            self.toggleBtn.isSelected = true
            self.timer?.resume()
        }
    }
}

