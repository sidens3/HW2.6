//
//  MainViewController.swift
//  ColorSlider
//
//  Created by Михаил Зиновьев on 06.11.2021.
//

import UIKit

protocol MainViewControllerDelegate {
    func setNewBackgroundColor(for color: UIColor)
}

class MainViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    
    private let settingsSegueIdentifier = "showSettingsViewController"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == settingsSegueIdentifier {
            guard let settingsViewController = segue.destination as? SettingsViewController else { return }
            settingsViewController.delegate = self
        }
    }

    @IBAction func editBarButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: settingsSegueIdentifier, sender: nil)
    }
}

//MARK: - MainViewControllerDelegate
extension MainViewController: MainViewControllerDelegate {
    func setNewBackgroundColor(for color: UIColor) {
        backgroundView.backgroundColor = color
    }
}
