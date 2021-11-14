//
//  RoundButton.swift
//  ch3_Calculator
//
//  Created by 윤병희 on 2021/11/06.
//

import UIKit

@IBDesignable //변경된 설정값을 Stroyboard에 실시간 확인할 수 있게
//느려져서 주석처리
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

    
}
