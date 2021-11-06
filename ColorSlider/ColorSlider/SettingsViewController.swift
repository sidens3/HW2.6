//
//  SettingsViewController.swift
//  ColorSlider
//
//  Created by Михаил Зиновьев on 22.10.2021.
//

import UIKit

private enum Constants {
    static let sliderValueFormat = "%.2f"
    static let defaultViewRadius: CGFloat = 8
}

class SettingsViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redColorSaturationLabel: UILabel!
    @IBOutlet weak var redColorSaturationSlider: UISlider!
    @IBOutlet weak var redColorUITextField: UITextField!
    
    @IBOutlet weak var greenColorSaturationLabel: UILabel!
    @IBOutlet weak var greenColorSaturationSlider: UISlider!
    @IBOutlet weak var greenColorUITextField: UITextField!
    
    @IBOutlet weak var blueColorSaturationLabel: UILabel!
    @IBOutlet weak var blueColorSaturationSlider: UISlider!
    @IBOutlet weak var blueColorUITextField: UITextField!
    
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDefaultSettings()
        updateUI()
    }
    
    // MARK: - IBAction
    @IBAction func redSliderChanged(_ sender: UISlider) {
        updateUI()
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        updateUI()
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        updateUI()
    }
    
    @IBAction func doneButtonPressed() {
        delegate?.setNewBackgroundColor(for: getCurrentCommonSliderColor())
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Private Methods
    private func setupDefaultSettings() {
        colorView.makeRound(with: Constants.defaultViewRadius)
        
        redColorSaturationSlider.defaultConfigure()
        greenColorSaturationSlider.defaultConfigure()
        blueColorSaturationSlider.defaultConfigure()
        
        redColorUITextField.delegate = self
        greenColorUITextField.delegate = self
        blueColorUITextField.delegate = self
    }
    
    private func updateUI() {
        updateSliderColor()
        updateColorSaturationLabel()
        updateTextField()
        updateViewColor()
    }
    
    private func getCurrentCommonSliderColor() -> UIColor {
        return UIColor(cgColor: CGColor(
                        red: CGFloat(redColorSaturationSlider.value),
                        green: CGFloat(greenColorSaturationSlider.value),
                        blue: CGFloat(blueColorSaturationSlider.value),
                        alpha: 1))
    }
    
    private func updateSliderColor() {
        redColorSaturationSlider.minimumTrackTintColor = UIColor(cgColor: CGColor(
                                                                    red: CGFloat(redColorSaturationSlider.value),
                                                                    green: .zero,
                                                                    blue: .zero,
                                                                    alpha: 1))
        
        greenColorSaturationSlider.minimumTrackTintColor = UIColor(cgColor: CGColor(
                                                                    red: .zero,
                                                                    green: CGFloat(greenColorSaturationSlider.value),
                                                                    blue: .zero,
                                                                    alpha: 1))
        
        blueColorSaturationSlider.minimumTrackTintColor = UIColor(cgColor: CGColor(
                                                                    red: .zero,
                                                                    green: .zero,
                                                                    blue: CGFloat(blueColorSaturationSlider.value),
                                                                    alpha: 1))
    }
    
    private func updateColorSaturationLabel() {
        redColorSaturationLabel.text =  String(format: Constants.sliderValueFormat,
                                               redColorSaturationSlider.value)
        greenColorSaturationLabel.text = String(format: Constants.sliderValueFormat,
                                                greenColorSaturationSlider.value)
        blueColorSaturationLabel.text = String(format: Constants.sliderValueFormat,
                                               blueColorSaturationSlider.value)
    }
    
    private func updateTextField() {
        redColorUITextField.text =  String(format: Constants.sliderValueFormat,
                                           redColorSaturationSlider.value)
        greenColorUITextField.text = String(format: Constants.sliderValueFormat,
                                            greenColorSaturationSlider.value)
        blueColorUITextField.text = String(format: Constants.sliderValueFormat,
                                           blueColorSaturationSlider.value)
    }
    
    private func updateViewColor() {
        colorView.backgroundColor = getCurrentCommonSliderColor()
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //todo выставлять значения соответствующего слайдера и лейбла в установленное значение
    }
}

// MARK: - UISlider
private extension UISlider {
    
    func defaultConfigure() {
        self.minimumValue = 0.00
        self.maximumValue = 1.00
        self.value = 0.55
    }
}

// MARK: - UIView
private extension UIView {
    
    func makeRound(with radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}

private extension CGFloat {
    static let zero = 0.0
}
