//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Isaac Lyons on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    //MARK: Properties
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLL dd yyyy"
        return formatter
    }
    var speed = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastTimeLabel.text = "--- -- ----"
        
        updateViews()
    }
    
    //MARK: Actions
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        startTimer()
    }
    
    //MARK: Private
    
    private func updateViews() {
        speedLabel.text = "\(speed) MPH"
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text ?? "")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func updateSpeed(timer: Timer) {
        if speed < 88 {
            speed += 1
        } else {
            resetTimer()
            lastTimeLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            showAlert()
        }
        
        updateViews()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else {return}
            datePickerVC.delegate = self
        }
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        let formattedDate = dateFormatter.string(from: date)
        destinationTimeLabel.text = formattedDate
    }
}
