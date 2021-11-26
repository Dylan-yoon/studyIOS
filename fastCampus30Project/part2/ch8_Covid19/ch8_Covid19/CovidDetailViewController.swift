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
    
    
    var covidOverview : CovidOverview?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

    }
    
    func configureView() {
        guard let covidOverview = self.covidOverview else { return }
        self.title = covidOverview.countryName + "?????"
        self.newCaseCell.detailTextLabel?.text = "\(covidOverview.newCase) 명"
        self.totalCaseCell.detailTextLabel?.text = "\(covidOverview.totalCase) 명"
        self.recoverdCell.detailTextLabel?.text = "\(covidOverview.recovered) 명"
        self.deathCell.detailTextLabel?.text = "\(covidOverview.death) 명"
        self.percentageCell.detailTextLabel?.text = "\(covidOverview.percentage) 명"
        self.overseasInflowCell.detailTextLabel?.text = "\(covidOverview.newFcase) 명"
        self.regionalOutBreakCell.detailTextLabel?.text = "\(covidOverview.newCcase) 명"
        
    }
        
    
    
}

