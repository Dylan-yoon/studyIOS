//
//  ViewController.swift
//  ch3_Calculator
//
//  Created by 윤병희 on 2021/11/05.
//

import UIKit

enum Operation {
    case Add
    case Substract
    case Divide
    case Multiply
    case unknown
}


class ViewController: UIViewController {

    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    
    var displayNumber = ""
    var firstOperand = "" //이전계산값 저장
    var secondOperand = "" //새롭게 입력된값 저장 프로퍼티
    var result = "" //결과값저장
    var currentOperation : Operation = .unknown //현재 계산기에 어떤 연산자가 입력되었는지 저장하는 프로퍼티
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
//MARK: - Button's
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return } // 타이틀이 숫자값, 옵셔널이기 때문에 바인딩!
        if self.displayNumber.count < 9 { //디스플레이에 9자리 숫자만,, 초과시 작동 x
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") { //두 조건 모두 충족시
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "." //3항연산자, displayNumber에 +=
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    @IBAction func tapSubstractButton(_ sender: UIButton) {
        self.operation(.Substract)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
        
    }
    
    func operation(_ operation : Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {// !self.displayNumber 가 비어있지 않으면!
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                    
                case .Substract:
                    self.result = "\(firstOperand - secondOperand)"
                    
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                    
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                    
                default:
                    break
                }
                
                if let result = Double(self.result) , result.truncatingRemainder(dividingBy: 1) == 0 {  //소수점을 없애는 방법
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            self.currentOperation = operation
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}

