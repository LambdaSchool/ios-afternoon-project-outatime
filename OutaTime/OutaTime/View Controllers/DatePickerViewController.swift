//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by brian vilchez on 7/24/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit
protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date:Date)
}

class DatePickerViewController: UIViewController {

    //MARK: Properties
    var delegate: DatePickerDelegate?
    @IBOutlet weak var datePicker: UIDatePicker!
    
     //MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    @IBAction func canceButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        guard let date = datePicker else {return }
       // delegate?.destinationDateWasChosen(date)
        dismiss(animated: true, completion: nil)
    }
    
}

extension DatePickerViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
       let selectedDate = date
        
    }
}
