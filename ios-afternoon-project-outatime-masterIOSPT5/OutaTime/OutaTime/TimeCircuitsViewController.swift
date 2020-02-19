//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by David Williams on 2/18/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit
import AudioToolbox

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var setDestinationButton: UIButton!
    @IBOutlet weak var travelBackButton: UIButton!
    
    var currentSpeed: Int = 0
    
    var delegate = DatePickerDelegate?.self
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1, alpha: 0.18)
        speedLabel.text = "\(currentSpeed) MPH"
        destinationTimeLabel.text = "--- -- ---"
        lastTimeDepartedLabel.text = "--- -- ---"
        presentTimeLabel.text = dateFormatter.string(from: Date())
        updateViews()
    }
    
    func reset() {
        currentSpeed = 0
        cancelTimer()
        travelBackButton.isEnabled = true
        setDestinationButton.isEnabled = true
    }
    
    func cancelTimer() {
        timer?.invalidate()
        lastTimeDepartedLabel.text = presentTimeLabel.text
        presentTimeLabel.text = destinationTimeLabel.text
        showAlert()
        speedLabel.text = "0 MPH"
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: speedUpdate(timer:))
    }
    
    func speedUpdate(timer: Timer) {
        if currentSpeed == 88 {
            reset()
        } else {
            currentSpeed += 1
            updateViews()
        }
    }
    
    func updateViews() {
        speedLabel.text = "\(currentSpeed) MPH"
    }
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        
        return formatter
    }()
    
    private func string(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let date = segue.destination as? DatePickerViewController {
            date.delegate = self
            playSound(fileName: "electricshock", fileExtension: ".mp3")
        }
    }
 

    @IBAction func travelBackButtonTapped(_ sender: Any) {
        playSound(fileName: "takingoff", fileExtension: ".wav")
        startTimer()
        travelBackButton.isEnabled = false
        setDestinationButton.isEnabled = false
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Oh Yeah! At A New Time!", message: "Your new date is \(presentTimeLabel.text ?? "Nowhere have you gone")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Travel some more!", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func playSound(fileName: String, fileExtension: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound);
        }
    }
    
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
