//
//  WriteDiaryViewController.swift
//  ch5_Diary
//
//  Created by 윤병희 on 2021/11/12.
//

import UIKit


//델리게이트를 통해서 다이어리 객체 전달
protocol WriteDiaryViewDelegate: AnyObject {
    func didSelectRegister(diary: Diary)
} //프로토콜이 정의 되었으면 WriteDiaryViewController에 델리게이트 프로퍼티 정의한다.


class WriteDiaryViewController: UIViewController {

    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    
    
    
    private let datePicker = UIDatePicker() //UIDatePicker라는 UIKit을 사용하기 위해 상수로 지정해 변경사항없이 사용하기위함
    private var diaryDate: Date? //datePicker에서 선택된 데이터 저장하는 변수라 생각
    weak var delegate : WriteDiaryViewDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.configureInputField()
        self.confirmButton.isEnabled = false        //isEnabled 메서드는 +버튼인 confirmButton을 활성화 시켜준다는 것인데, 현재 날짜,제목,내용 이 입력되었을 때 활성화 시켜야하므로 초기 false 로 설정한다.
    }
    
    
    //MARK: --contentsTextView의 레이아웃 설정

    //레이아웃이 설정되지
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contentsTextView.layer.borderColor = borderColor.cgColor//레이어 관련은 Cg컬러로
        self.contentsTextView.layer.borderWidth = 0.5 //레이어의 테두리 너비
        self.contentsTextView.layer.cornerRadius = 5.0 //. 둥글기
        // 내용 TextView의 layer가 설정되지않았기 때문에 configure 한뒤 viewDidLoad에 오버라이드한다.
    }
    
    
    
    
    //위에 설정해준 datePicker의 UIDatePickerd의 메서드 들을 정의해준다.
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels //DatePicker의 스타일 3가지가 있고(wheels, compact,  inline) automatic이 있다.
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        //@objc private func titleTextFieldDidChange 에 selector을 넣어주기 위해. 정의해준다(?)
        self.dateTextField.inputView = self.datePicker
        
    }
    
    
    //MARK: 날짜, 제목 내용이 변경될 때 마다 ~
    private func configureInputField() {
        self.contentsTextView.delegate = self //Cannot assign value of type 'WriteDiaryViewController' to type 'UITextViewDelegate?' 이때 extension으로 채택한다.
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
    } //이 메서드들을 구현하고 오버라이드 해주어야 한다. -->self.configureInputField()
    
    
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contentsTextView.text else { return }
        guard let date = self.diaryDate else { return }
        let diary = Diary(title: title, contents: contents, date: date, isStar: false)
        self.delegate?.didSelectRegister(diary: diary)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formmater = DateFormatter() //날짜와 텍스트 변환,,
        formmater.dateFormat = "yyyy년 MM 월 dd일(EEEEE)"
        formmater.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formmater.string(from: datePicker.date)
        self.dateTextField.sendActions(for: .editingChanged)//날짜가 바뀔 때 마다 호출된다. picker을 사용할때 구현한다.
    }
    
    
    
    
    
    //MARK: 제목이 입력될 때 마다 등록버튼 활성화 여부를 판단 할 수 있도록.
    @objc private func titleTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    
    
    @objc private func dateTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField() // 날짜 변경될때 등록버튼 활성화
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //화면 터치하면 키보드 사라지는 메서드 오버라이드
        self.view.endEditing(true)
    }
    
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
    
}

extension WriteDiaryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
