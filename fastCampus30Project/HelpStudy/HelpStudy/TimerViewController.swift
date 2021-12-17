//
//  TimerViewController.swift
//  HelpStudy
//
//  Created by 윤병희 on 2021/12/08.
//

import UIKit


enum TimeStatus {
    case stop
    case start
    case end
}

class TimerViewController: UIViewController {
    @IBOutlet weak var todayLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UIButton!                ///alert 으로 목표설정

    @IBOutlet weak var studyTypePicker: UITextField!
    
    @IBOutlet var timerLabel: UIView!
    
    @IBOutlet weak var configureImage: UIStackView! //시작버튼 누르면 사라지게 구현한다
    
    var todays = Date() //오늘 날짜 설정
    var studyType = ["computer", "statics", "chemistry"]
    var timeStatus :TimeStatus = .end
    
    var duration : Int = 0
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
        formatter.dateFormat = "yyyy년 MM월 dd일 hh.mm.ss"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    
    
//MARK: -Action btn
    
    //클릭 시 alertsheet로 목표 설정 & 변경
    @IBAction func titleBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)                  //actionSheet 할 때 런타임 오류
        let registerBtn = UIAlertAction(title: "Register", style: .default, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
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
        
        
    }
    
    
    //공부 끝 클릭과 동시에 알럿 시트를 이용해 집중도 평가, 후 모든 정보 userdefualt에 전달 후 저장, 테이블 뷰에 load
    @IBAction func stopBtn(_ sender: UIButton) {
    }
    
//    타이머 상태 스위칭

//    func TimerStatus()  {
//        switch self.timeStatus {
//        case .end :
//            return 0
//        case .start :
//            return 1
//        case .stop :
//            return 2
//    }
    

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
