//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Claudia Contreras on 2/18/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var datePicker: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - IBAction
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
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
