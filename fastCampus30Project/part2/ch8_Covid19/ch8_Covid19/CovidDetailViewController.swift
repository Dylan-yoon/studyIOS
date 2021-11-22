//
//  CovidDetailViewController.swift
//  ch8_Covid19
//
//  Created by 윤병희 on 2021/11/22.
//

import UIKit

class CovidDetailViewController: UITableViewController {

    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    
    @IBOutlet weak var recoverdCell: UITableViewCell!
    
    @IBOutlet weak var deathCell: UITableViewCell!
    
    @IBOutlet weak var percentageCell: UITableViewCell!
    
    
    @IBOutlet weak var overseasInflowCell: UITableViewCell!
    
    @IBOutlet weak var regionalOutBreakCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

