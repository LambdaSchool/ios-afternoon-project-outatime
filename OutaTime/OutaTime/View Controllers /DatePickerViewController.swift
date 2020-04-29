//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Sammy Alvarado on 4/27/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var cancelButtonLabel: UIButton!
    @IBOutlet weak var doneButtonLabel: UIButton!
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
//        delegate?.destinationDateWasChosen(date: self)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    

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
