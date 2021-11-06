//
//  MainViewController.swift
//  ColorSlider
//
//  Created by Михаил Зиновьев on 06.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    
    private let settingsSegueIdentifier = "showSettingsViewController"
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == settingsSegueIdentifier {
            guard let settingsViewController = segue.destination as? SettingsViewController else { return }
            
        }
    }

    @IBAction func editBarButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: settingsSegueIdentifier, sender: nil)
    }
    
    
}
