//
//  ColorSliderViewController.swift
//  ColorSlider
//
//  Created by Михаил Зиновьев on 22.10.2021.
//

import UIKit

private enum Constants {
    static let sliderValueFormat = "%.2f"
    static let defaultViewRadius: CGFloat = 8
}

class ColorSliderViewController: UIViewController {
    @IBOutlet weak var currentColorView: UIView!
    
    @IBOutlet weak var redColorSaturationLabel: UILabel!
    @IBOutlet weak var redColorSaturationSlider: UISlider!
    
    @IBOutlet weak var greenColorSaturationLabel: UILabel!
    @IBOutlet weak var greenColorSaturationSlider: UISlider!
    
    @IBOutlet weak var blueColorSaturationLabel: UILabel!
    @IBOutlet weak var blueColorSaturationSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentColorView.makeRound(with: Constants.defaultViewRadius)
        
        redColorSaturationSlider.defaultConfigure()
        greenColorSaturationSlider.defaultConfigure()
        blueColorSaturationSlider.defaultConfigure()
        
        redColorSaturationSlider.minimumTrackTintColor = .red
        greenColorSaturationSlider.minimumTrackTintColor = .green
        blueColorSaturationSlider.minimumTrackTintColor = .blue
        
        redColorSaturationLabel.text = String(redColorSaturationSlider.value)
        greenColorSaturationLabel.text = String(greenColorSaturationSlider.value)
        blueColorSaturationLabel.text = String(blueColorSaturationSlider.value)
    }

    @IBAction func redSliderChanged(_ sender: UISlider) {
        setCurrentColorViewColor()
        redColorSaturationLabel.text = String(format: Constants.sliderValueFormat,
                                              redColorSaturationSlider.value)
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        setCurrentColorViewColor()
        greenColorSaturationLabel.text = String(format: Constants.sliderValueFormat,
                                                greenColorSaturationSlider.value)
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        setCurrentColorViewColor()
        blueColorSaturationLabel.text = String(format: Constants.sliderValueFormat,
                                               blueColorSaturationSlider.value)
    }
    
    private func setCurrentColorViewColor() {
        currentColorView.backgroundColor = UIColor(cgColor: CGColor(
                                                    red: CGFloat(redColorSaturationSlider.value),
                                                    green: CGFloat(greenColorSaturationSlider.value),
                                                    blue: CGFloat(blueColorSaturationSlider.value),
                                                    alpha: 1))
        
    }
}

private extension UISlider {
    
    func defaultConfigure() {
        self.minimumValue = 0.00
        self.maximumValue = 1.00
        self.value = 0.50
    }
}

private extension UIView {
    
    func makeRound(with radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}
