//
//  OptionsViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 16/06/2023.
//

import UIKit

class OptionsViewController: UIViewController {
    
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minimumLabel: UILabel!
    @IBOutlet weak var maximumLabel: UILabel!
    
    @IBOutlet weak var secondsSlider: UISlider!
    @IBOutlet weak var minimumSlider: UISlider!
    @IBOutlet weak var maximumSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSeconds()
        setupMin()
        setupMax()
    }
    
    private func setupSeconds() {
        let min = getIntValueFrom(key: AppConstants.keySecondsValue) ?? AppConstants.secondsValue
    
        secondsLabel.text = String(min)
        secondsSlider.value = Float(min)
    }
    
    private func setupMin() {
        let min = getIntValueFrom(key: AppConstants.keyMinValue) ?? AppConstants.minValue
    
        minimumLabel.text = String(min)
        minimumSlider.value = Float(min)
    }
    
    private func setupMax() {
        let max = getIntValueFrom(key: AppConstants.keyMaxValue) ?? AppConstants.maxValue
        
        maximumLabel.text = String(max)
        maximumSlider.value = Float(max)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func secondsSliderValueChanged(_ sender: UISlider) {
        let roundedValue = getRoundedValueFrom(sliderValue: sender.value, sliderStep: 2)
        sender.value = roundedValue
        secondsLabel.text = String(Int(sender.value))
        saveKeyValuePair(AppConstants.keySecondsValue, Int(roundedValue))
    }
    
    @IBAction func minimumSliderValueChanged(_ sender: UISlider) {
        let min = getIntValueFrom(key: AppConstants.keyMinValue) ?? AppConstants.minValue
        let roundedValue = getRoundedValueFrom(sliderValue: sender.value, sliderStep: 10)
        
        if roundedValue < maximumSlider.value {
            sender.value = roundedValue
            saveKeyValuePair(AppConstants.keyMinValue, Int(roundedValue))
        } else {
            sender.value = Float(min)
        }
        
        minimumLabel.text = String(Int(sender.value))
    }
    
    @IBAction func maximumSliderValueChanged(_ sender: UISlider) {
        let max = getIntValueFrom(key: AppConstants.keyMaxValue) ?? AppConstants.maxValue
        let roundedValue = getRoundedValueFrom(sliderValue: sender.value, sliderStep: 10)
        
        if minimumSlider.value < roundedValue {
            sender.value = roundedValue
            saveKeyValuePair(AppConstants.keyMaxValue, Int(roundedValue))
        } else {
            sender.value = Float(max)
        }
        
        maximumLabel.text = String(Int(sender.value))
    }
    
    
    private func getRoundedValueFrom(sliderValue: Float, sliderStep: Float) -> Float {
        round(sliderValue / sliderStep) * sliderStep
    }
    
    private func getIntValueFrom(key: String) -> Int? {
        UserDefaults.standard.object(forKey: key) as? Int
    }
    
    private func saveKeyValuePair(_ key: String, _ value: Int) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
