//
//  MainViewController.swift
//  My RandomiZzer
//
//  Created by Pavel Kuzovlev on 29.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    @IBOutlet var getRandomNumberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getRandomNumberButton.layer.cornerRadius = 20

        
    }
    
    @IBAction func getRandomNumberButtonTapped() {
        let minimumNumber = Int (minimumValueLabel.text ?? "") ?? 0
        let maximumNumber = Int (maximumValueLabel.text ?? "") ?? 100
        
        randomValueLabel.text = String(Int.random(in: minimumNumber ... maximumNumber))
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.minimumValue = minimumValueLabel.text
        settingsVC.maximumValue = maximumValueLabel.text
        }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingsViewController else { return }
        minimumValueLabel.text = settingsVC.minimumValueTF.text
        maximumValueLabel.text = settingsVC.maximumValueTF.text
           
    }
}
