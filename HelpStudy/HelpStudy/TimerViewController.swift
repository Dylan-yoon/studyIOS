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
    @IBOutlet weak var goalBtnText: UIButton!
    @IBOutlet weak var studyTypePicker: UITextField!   //피커뷰로 공부 타입 선택
    
    
    @IBOutlet var timerLabel: UIView!
    @IBOutlet weak var pauseLabel: UIButton!
    @IBOutlet weak var startLabel: UIButton!
    
    
    @IBOutlet weak var configureImage: UIStackView! //시작버튼 누르면 [날짜,타이틀, 타입, 시작버튼] 사라지게 구현한다
    @IBOutlet weak var stopwatchLabel: UIStackView! //스톱워치 구현
    
    //MARK: - 상수 변수 생성
    
    var todays = Date() //오늘 날짜 설정
    var studyType = ["computer", "statics", "chemistry"]
    //추후 설정 탭에서 직접 추가 및 변경 가능하도록 변경
    
    var timeStatus :TimeStatus = .end //timeStatus 를 초기상태 end로 초기화
//    var studyTarget = self.titleLabel
    
    var studytitle : String?  = nil
    
    
    
    var duration : Int = 0 //타이머 초기값
    var timer = Timer()
    
    
    
    
    //MARK: -Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTimer()
        self.initfont()
        
        
        
        
        //pickerView
        createPickerView()
        dismissPickerView()
        studyTypePicker.tintColor = .clear //textfiled내 커서 깜빡임을 없앤다.
        
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
    
    
    
//MARK: -Action Button, alert
    
    //클릭 시 alertsheet로 목표 설정 & 변경
    
    
    @IBAction func titleBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "목표 설정", message: nil, preferredStyle: .alert)
        let registButton = UIAlertAction(title: "Regist", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }  //텍스트필드에 입력한 내용은 배열로 생성됨 [0]
            self?.goalBtnText.titleLabel?.text = title
            self?.goalBtnText.titleLabel?.textColor = UIColor.init(red: 114, green: 238, blue: 223, alpha: 1)
            
            
        //텍스트필드에 적은 내용..타이틀 바꾸는법은뭘까 ㅠ
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
            self.goalBtnText.titleLabel?.textColor = UIColor.black
        })
        alert.addAction(registButton)
        alert.addAction(cancelButton)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "목표를 설정해주세요."
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func initfont() {
        goalBtnText.titleLabel?.textColor = UIColor.black
        
    }
    
    func reloadTextLabel() {
        
    }

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






//MARK: -PickerView 설정
extension TimerViewController : UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.studyType.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.studyType[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.studyTypePicker.text = studyType[row]
    }
    
    
    //이 함수를 오버라이드 하지않으면 pickerView가 열리지 않는다.
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        studyTypePicker.inputView = pickerView
    }
    
    //PickerView 속성 변경
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.pickeractions))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        studyTypePicker.inputAccessoryView = toolBar
    }
    
    //pickerView 선택 버튼 클릭시 액션 설정, 
    @objc func pickeractions() {
        
    }
    
}


// https://dkfk2747.tistory.com/20 pickerView 참고
//여기서 추가해야 할 것은
