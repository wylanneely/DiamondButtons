//
//  SettingsViewController.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/6/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        easyButton.setTitleColor(.green, for: .normal)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var medButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var pianoButton: UIButton!
    @IBOutlet weak var guitarMajorButton: UIButton!
    
    @IBOutlet weak var violinButton: UIButton!
   
    @IBAction func easyButtonTapped(_ sender: UIButton) {
        GameController.shared.setNumberOfLifes(int: 5)
        GameController.shared.resetGame()
        easyButton.setTitleColor(.green, for: .normal)
        hardButton.setTitleColor(.blue, for: .normal)
        medButton.setTitleColor(.blue, for: .normal)
    }
    
    @IBAction func medButtonTapped(_ sender: UIButton) {
        GameController.shared.setNumberOfLifes(int: 3)
        GameController.shared.resetGame()
        easyButton.setTitleColor(.blue, for: .normal)
        medButton.setTitleColor(.green, for: .normal)
        hardButton.setTitleColor(.blue, for: .normal)
    }
    @IBAction func hardButtonTapped(_ sender: UIButton) {
        GameController.shared.setNumberOfLifes(int: 1)
        GameController.shared.resetGame()
        easyButton.setTitleColor(.blue, for: .normal)
        medButton.setTitleColor(.blue, for: .normal)
        hardButton.setTitleColor(.green, for: .normal)
    }
    
   
    @IBAction func pianoButtonTapped(_ sender: Any) {
        SoundController.shared.audioFilePath = .pianoSounds
        GameController.shared.resetGame()
        pianoButton.setTitleColor(.green, for: .normal)
        guitarMajorButton.setTitleColor(.blue, for: .normal)
        violinButton.setTitleColor(.blue, for: .normal)
    }
    
    @IBAction func guitarMajorButtonTapped(_ sender: Any) {
        SoundController.shared.audioFilePath = .guitarMajorChords
        GameController.shared.resetGame()
        pianoButton.setTitleColor(.blue, for: .normal)
        guitarMajorButton.setTitleColor(.green, for: .normal)
        violinButton.setTitleColor(.blue, for: .normal)
    }
    
    @IBAction func violinButtonTapped(_ sender: Any) {
        SoundController.shared.audioFilePath = .violinSounds
        GameController.shared.resetGame()
        pianoButton.setTitleColor(.blue, for: .normal)
        guitarMajorButton.setTitleColor(.blue, for: .normal)
        violinButton.setTitleColor(.green, for: .normal)
    }
    

    

}
