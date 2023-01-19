//
//  FocusVC.swift
//  PomodoroApp
//
//  Created by Mehdican Büyükplevne on 18.01.2023.
//

import UIKit

class FocusVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    //MARK: Variables
    var timer = Timer()
    var isTimerStarted = false
    var time = 2
    var delegate: TransferTimeProtocol?
    
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllTimes()
        timer.invalidate()
        isTimerStarted = false
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.systemGreen, for: .normal)
        cancelButton.alpha = 0.5
    }
    
    // MARK: All Times Func.
    func getAllTimes() {
        if timeLabel.text == "5:00" {
            time = 300
        }
        if timeLabel.text == "6:00"{
            time = 360
        }
        if timeLabel.text == "7:00"{
            time = 420
        }
        if timeLabel.text == "8:00"{
            time = 480
        }
        if timeLabel.text == "9:00"{
            time = 540
        }
        if timeLabel.text == "10:00"{
            time = 600
        }
        if timeLabel.text == "11:00"{
            time = 660
        }
        if timeLabel.text == "12:00"{
            time = 720
        }
        if timeLabel.text == "13:00"{
            time = 780
        }
        if timeLabel.text == "14:00"{
            time = 840
        }
        if timeLabel.text == "15:00"{
            time = 900
        }
        if timeLabel.text == "16:00"{
            time = 960
        }
        if timeLabel.text == "17:00"{
            time = 1020
        }
        if timeLabel.text == "18:00"{
            time = 1080
        }
        if timeLabel.text == "19:00"{
            time = 1140
        }
        if timeLabel.text == "20:00"{
            time = 1200
        }
        if timeLabel.text == "21:00"{
            time = 1260
        }
        if timeLabel.text == "22:00"{
            time = 1320
        }
        if timeLabel.text == "23:00"{
            time = 1380
        }
        if timeLabel.text == "24:00"{
            time = 1440
        }
        if timeLabel.text == "25:00"{
            time = 2
        }
    }
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toChangeTime" {
            let vc =  segue.destination as! TimeSliderVC
            vc.delegate = self
            timer.invalidate()
            
            
        }
    }
    
    // MARK: Cancel Button
    @IBAction func cancelButtonClicked(_ sender: Any) {
        startButton.isEnabled = true
        cancelButton.isEnabled = false
        cancelButton.alpha = 0.5
        timer.invalidate()
        isTimerStarted = false
        timeLabel.text = "25:00"
        time = 1500
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.systemGreen, for: .normal)
    }
    
    // MARK: Start Button
    @IBAction func startButtonClicked(_ sender: Any) {
        cancelButton.isEnabled = true
        cancelButton.alpha = 1.0
        if !isTimerStarted {
            startTimer()
            isTimerStarted = true
            startButton.setTitle("Pause", for: .normal)
            startButton.setTitleColor(.systemOrange, for: .normal)
        } else {
            timer.invalidate()
            isTimerStarted = false
            startButton.setTitle("Resume", for: .normal)
            startButton.setTitleColor(.systemPink, for: .normal)
        }
    }
    
    //MARK: Start Timer Func.
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if time < 1 {
            timer.invalidate()
            startButton.setTitle("Süre Bitti", for: .normal)
            startButton.setTitleColor(.systemRed, for: .normal)
            startButton.isEnabled = false
        }else{
            time -= 1
            timeLabel.text = formatTime()
            
        }
    }
    
    //MARK: Format Time Func.
    func formatTime() -> String {
        let minutes = Int(time) / 60 & 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    
}

extension FocusVC: TransferTimeProtocol {
    func transferTime(chooseTime: String) {
        timeLabel.text = "\(chooseTime):00"
    }
}

