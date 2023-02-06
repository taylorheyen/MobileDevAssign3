//
//  ViewController.swift
//  TimerAssignment
//
//  Created by Taylor Heyen on 2/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var LiveClock: UILabel!
    
    let dateFormatter = DateFormatter()
    
    @objc func updateTime() {
        dateFormatter.dateFormat = "E, dd MMM yyyy hh:mm:ss a"
        LiveClock.text = dateFormatter.string(from: Date())
        
        
        if dateFormatter.string(from: Date()).contains("AM") {
            backgroundImage.image = UIImage(named: "Image 1")
        } else {
            backgroundImage.image = UIImage(named: "Image 3")        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var timeRemain: UILabel!
    
    @IBOutlet weak var StartTimeButton: UIButton!
    
    var timer: Timer?
    
    @IBAction func startTimerTapped(_ sender: Any) {
        if StartTimeButton.currentTitle == "Start Timer" {
                let selectedTime = datePicker.date
                let currentTime = Date()
                let timeInterval = selectedTime.timeIntervalSince(currentTime)

                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                    self?.updateCountdown(timeInterval: timeInterval)
                }
                
                StartTimeButton.setTitle("Stop Timer", for: .normal)
            } else {
                timer?.invalidate()
                StartTimeButton.setTitle("Start Timer", for: .normal)
            }
        }

        func updateCountdown(timeInterval: TimeInterval) {
            let currentTime = Date()
            let elapsedTime = currentTime.timeIntervalSince(datePicker.date)
            let remainingTime = timeInterval - elapsedTime
            
            let hour = Int(remainingTime / 3600)
            let minute = Int((remainingTime.truncatingRemainder(dividingBy: 3600)) / 60)
            let second = Int(remainingTime.truncatingRemainder(dividingBy: 60))
            timeRemain.text = String(format: "%02d:%02d:%02d", hour, minute, second)
        }
    
    func playMusic() {
       
        
    }
}
