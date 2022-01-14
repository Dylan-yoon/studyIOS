//
//  AddAlertViewController.swift
//  Ch4_Drink
//
//  Created by 윤병희 on 2022/01/11.
//

import UIKit

class AddAlertViewController: UIViewController  {

    
    var pickedDate: ((_ date:Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    
    @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
