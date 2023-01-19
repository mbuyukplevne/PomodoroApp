//
//  TimeSliderVC.swift
//  PomodoroApp
//
//  Created by Mehdican Büyükplevne on 18.01.2023.
//

import UIKit

// MARK: For Transfer Protocol
protocol TransferTimeProtocol {
    func transferTime(chooseTime: String)
}

class TimeSliderVC: UIViewController {
    
    // MARK: Variables
    var delegate: TransferTimeProtocol?
    
    // MARK: Outlets
    @IBOutlet weak var changeTimeLabel: UILabel!
    @IBOutlet weak var sliderLabel: UISlider!
    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Focus Button
    @IBAction func focusButtonClicked(_ sender: Any) {
        delegate?.transferTime(chooseTime: changeTimeLabel.text!)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Slider Action
    @IBAction func focusSlider(_ sender: Any) {
        delegate?.transferTime(chooseTime: changeTimeLabel.text!)
        changeTimeLabel.text = String(Int(round(sliderLabel.value)))
    }
}
