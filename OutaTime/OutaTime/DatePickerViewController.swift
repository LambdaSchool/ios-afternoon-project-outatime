//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Tobi Kuyoro on 13/11/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: class {
    func destinationDateWasChosen(date: Date)
   }

class DatePickerViewController: UIViewController {
    
    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
    }
    
    @IBAction func doneButton(_ sender: Any) {
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
