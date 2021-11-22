//
//  ViewController.swift
//  ch8_Covid19
//
//  Created by 윤병희 on 2021/11/22.
//

import UIKit
import Charts       //파이차트 사용하기위해 인포트한다

class ViewController: UIViewController {

    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UIStackView!
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

