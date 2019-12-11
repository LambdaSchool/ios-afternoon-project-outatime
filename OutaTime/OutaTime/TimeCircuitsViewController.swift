//
//  TimeCircuitsViewController.swift
//  OutaTune
//
//  Created by Joshua Rutkowski on 12/10/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import UIKit
import AVFoundation

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var destinationButton: UIButton!
    @IBOutlet weak var travelBackButton: UIButton!
    
    struct PropertyKeys {
         static let segue = "ModalDestinationDatePickerSegue"
     }
    
    //MARK: - Properties
    let customFont = UIFont(name: "Digits", size: UIFont.systemFontSize)
    let customLabel = UILabel()
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLL dd yyyy HH:mm"
        return formatter
    }()
    
    var speed = 0
    var destinationDate: Date? = Date()
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presentTimeLabel.text = string(from: Date())
        destinationTimeLabel.text = string(from: Date())
        lastTimeDepartedTimeLabel.text = "--- -- --- --:--"
    }
    
    func updateView() {
         guard let newLastDate = presentTimeLabel.text, let destinationDate = destinationDate else { return }

         presentTimeLabel.text = string(from: destinationDate)
         lastTimeDepartedTimeLabel.text = newLastDate
         speed = 0
         destinationTimeLabel.text = string(from: destinationDate)
//        lastTimeDepartedTimeLabel.text = presentTimeLabel.text
     }
    
    private func string(from date: Date) -> String {
         return dateFormatter.string(from: date).uppercased()
     }
    
    //MARK: - Functions
    func updateSpeed() {

         Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
             self.speedLabel.text = "\(self.speed) MPH"
             self.speed += 1
             if self.speed == 89 {
                 timer.invalidate()
                 self.updateView()
                 self.showAlert()
             }
         }
     }
    
    private func showAlert() {
        
        let resourcePath = Bundle.main.resourcePath
        let url = Bundle.main.url(forResource: "greatscott2", withExtension: "wav")
        self.audioPlayer = try? AVAudioPlayer.init(contentsOf: url!, fileTypeHint: AVFileType.wav.rawValue)
//        self.audioPlayer?.numberOfLoops = 1
        audioPlayer?.play()
        
        let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(string(from: destinationDate!))", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.audioPlayer?.stop()}))
            self.present(alert, animated: true, completion: nil)
             audioPlayer?.play()
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == PropertyKeys.segue {
             guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
             datePickerVC.delegate = self
         }
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - Actions
    
    @IBAction func travelBackButtonPressed(_ sender: UIButton) {
        updateSpeed()
    }
    
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func DestinationWasChosen(_ date: Date) {
            destinationDate = date
            destinationTimeLabel.text = string(from: date)
    }
}
