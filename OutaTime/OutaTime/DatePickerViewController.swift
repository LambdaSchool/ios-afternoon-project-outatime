//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Morgan Smith on 12/10/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Done(_ sender: Any) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
