//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Harmony Radley on 3/25/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var departedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var presentTimeTextField: UITextField!
    @IBOutlet weak var lastTimeTextField: UITextField!
    @IBOutlet weak var speedTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
        
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
