//
//  TimerViewController.swift
//  HelpStudy
//
//  Created by 윤병희 on 2021/12/08.
//

import UIKit


enum TimeStatus {
    case pause
    case start
    case end
}

class TimerViewController: UIViewController {
    @IBOutlet weak var todayLabel: UILabel!     //날짜표시
    
    @IBOutlet weak var goalBtn: UIButton!
    
    @IBOutlet weak var studyTypePicker: UITextField!   //피커뷰로 공부 타입 선택
    
    @IBOutlet var timerLabel: UIView!
    @IBOutlet weak var pauseLabel: UIButton!
    @IBOutlet weak var startLabel: UIButton!
    
    @IBOutlet weak var configureImage: UIStackView! //시작버튼 누르면 [날짜,타이틀, 타입, 시작버튼] 사라지게 구현한다
    @IBOutlet weak var stopwatchLabel: UIStackView! //스톱워치 구현
    
    
    var todays = Date() //오늘 날짜 설정
    var studyType = ["computer", "statics", "chemistry"]
    var timeStatus :TimeStatus = .end //timeStatus 를 초기상태 end로 초기화
//    var studyTarget = self.titleLabel
    
    
    var duration : Int = 0 //타이머 초기값
    var timer = Timer()
    
    
    
    
    //MARK: -Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTimer()
    }
    
    
    //시간 설정
    private func configureTimer() {
        self.todayLabel.text = dateToString(date: todays)
    }
    
    private func dateToString(date : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 hh시mm분"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    
    
//MARK: -Action btn
    
    //클릭 시 alertsheet로 목표 설정 & 변경
    
    
    @IBAction func titleBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "목표 설정", message: nil, preferredStyle: .alert)
        let registButton = UIAlertAction(title: "regist", style: .default, handler: { [weak self] _ in      //alert에 버튼이 추가되게 만든다.
            guard let goal = alert.textFields?[0].text else { return }                                         //alert.textFields?[0].text 를 가드문으로
            self?.goalBtn.titleLabel?.text = goal
            self?.goalBtn.titleLabel?.textColor = UIColor.init(red: 114, green: 238, blue: 223, alpha: 1)
            
          //텍스트필드에 적은 내용..타이틀 바꾸는법은뭘까 ㅠ
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let emptybtn = UIAlertAction(title: "empty", style: .default, handler: nil)
        alert.addAction(registButton)
        alert.addAction(cancelButton)
        alert.addAction(emptybtn)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "목표를 설정해주세요."
        })
        self.present(alert, animated: true, completion: nil)

    }
    
    
    func setTitleBtn() {
        
    }
    
    
    /*
    let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)                  //actionSheet 할 때 런타임 오류
    let registerButton = UIAlertAction(title: "Register", style: .default, handler: { [weak self] _ in      //alert에 버튼이 추가되게 만든다.
        guard let title = alert.textFields?[0].text else { return }                                         //alert.textFields?[0].text 를 가드문으로
        let task = Task(title: title, done: false)
        self?.tasks.append(task)                //tasks 배열에 append(추가)
        self?.tableView.reloadData()
    })
    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)                 //alert에 취소버튼 추가되게 만든다.
    let emptybtn = UIAlertAction(title: "empty", style: .default, handler: nil)
    //위에 상수를 생성 해놓고 alert.addAction 으로 버튼 생성한다.
    alert.addAction(cancelButton)   //취소버튼생성
    alert.addAction(registerButton) //저장 버튼 생성
    alert.addAction(emptybtn)
    alert.addTextField(configurationHandler: { textField in                                 //텍스트Field 생성
        textField.placeholder = "할 일을 입력해주세요."
    })
    self.present(alert, animated: true, completion: nil)
    */
    
    @IBAction func startBtn(_ sender: UIButton) {
        //구현내용 : 타이틀과 스터디타입 설정 했을 때 시작버튼활성화 , 시작버튼 클릭시 타이머와 stop 버튼만 보여짐,
        self.duration = 0 //타이머 초기값으로
        self.configureImage.isHidden = true
        self.stopwatchLabel.isHidden = false
        //스토머치 구현
        
        
    }
    @IBAction func pauseBtn(_ sender: UIButton) {
        //타이머 스탑 구현
        self.pauseLabel.setTitle("재개", for: .normal)
        
    }
    
    
    //공부 끝 클릭과 동시에 알럿 시트를 이용해 집중도 평가, 후 모든 정보 userdefualt에 전달 후 저장, 테이블 뷰에 load
    @IBAction func stopBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
}






//PickerView 설정
extension TimerViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.studyType.count
    }
}
