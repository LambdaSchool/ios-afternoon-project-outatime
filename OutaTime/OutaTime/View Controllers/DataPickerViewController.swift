//
//  DataPickerViewController.swift
//  OutaTime
//
//  Created by Richard Gibbs on 5/20/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit

class DataPickerViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func tappedDone(_ sender: Any) {
    }
    
    @IBAction func tappedCancel(_ sender: Any) {
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
