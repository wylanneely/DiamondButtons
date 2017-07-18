//
//  CustomTabbarViewController.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/3/17.
//  Copyright © 2017 Wylan. All rights reserved.
//
import CoreGraphics
import UIKit

class MainViewController: UIViewController {
    
    //MARK: - GameMode
    override func viewWillAppear(_ animated: Bool) {
        updateLabels()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
        setupContraints()
    }
        
    //MARK: - Labels
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    
    func updateLabels() {
        self.scoreLabel.text = "Score: \(GameController.shared.score)"
        self.livesLabel.text = "Lives: \(GameController.shared.lifes)"
    }
    
    //MARK: - IBActions
    @IBAction func resetButtonTapped(_ sender: Any) {
        GameController.shared.resetGame()
        updateLabels()
        resetButtonStates()
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        resetButtonStates()
        GameController.shared.getPlaySoundIndex()
        guard let soundIndex = GameController.shared.lastPlaySoundIndex else {return}
        SoundController.shared.playSoundWith(noteIndex: soundIndex)
        updateLabels()
    }
    
    func resetButtonStates() {
        aButton.hasButtonBeenTapped = false
        bButton.hasButtonBeenTapped = false
        cButton.hasButtonBeenTapped = false
        dButton.hasButtonBeenTapped = false
        eButton.hasButtonBeenTapped = false
        fButton.hasButtonBeenTapped = false
        gButton.hasButtonBeenTapped = false
    }
    
    func hasButtonBeenTapped(button: DiamondShapedButton) -> Bool {
        return button.hasButtonBeenTapped
    }
    
    //MARK: - NoteButton Tapped
    func touchDown(button: DiamondShapedButton, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)
            if button.path.contains(location) == true {
                button.cancelTracking(with: nil)
                // IF Button is Tapped inside the diamond then do code below
                
                if button.hasButtonBeenTapped == true {
                    SoundController.shared.playSoundWith(noteIndex: button.tag)
                    return
                }
                
                SoundController.shared.playSoundWith(noteIndex: button.tag)
                GameController.shared.updateLivesAndScoreWith(buttonPressedSoundIndex: button.tag)
                button.hasButtonBeenTapped = true
                updateLabels()
                
                if GameController.shared.lifes == 0 {
                    
                    if HighScoreController.shared.isNewHighScoreAHighScore(newScore: GameController.shared.score) == true {
                        self.presentHighScoreAlert(score: GameController.shared.score)
                        
                    } else { self.presentAlert() }
                }
            }
        }
    }
    
    //MARK: - Alerts
    func presentAlert(){
        let alertController = UIAlertController(title: "Finished", message: "Good Job, Try Again?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
        }
        let resetAction = UIAlertAction(title: "Reset", style: .default) { _ in
            self.resetButtonTapped(self)
            self.playButtonTapped(self)
        }
        alertController.addAction(resetAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentHighScoreAlert(score: Int){
        let alertController = UIAlertController(title: "HighScore", message: "Good Job! You made the Highscores", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
        }
        
        let resetAction = UIAlertAction(title: "Submit", style: .default) { _ in
            self.resetButtonTapped(self)
            guard let name = alertController.textFields?[0].text else {return}
            let startingLifes = GameController.shared.startingLives
            let highscore = HighScore(name: name, lives: startingLifes, score: score)
            HighScoreController.shared.compareAndSave(newHighScore: highscore)
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Name..."
        }
        alertController.addAction(resetAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    //MARK: - Buttons and Contraints
    
    let aButton = DiamondShapedButton()
    let bButton = DiamondShapedButton()
    let dButton = DiamondShapedButton()
    let cButton = DiamondShapedButton()
    let eButton = DiamondShapedButton()
    let fButton = DiamondShapedButton()
    let gButton = DiamondShapedButton()
    
    
    func setUpButtons() {
        
        aButton.addTarget(self, action: #selector(touchDown), for: .touchDown)
        bButton.addTarget(self, action: #selector(touchDown), for: .touchDown)
        cButton.addTarget(self, action: #selector(touchDown), for: .touchDown)
        dButton.addTarget(self, action: #selector(touchDown), for: .touchDown)
        eButton.addTarget(self, action: #selector(touchDown), for: .touchDown)
        fButton.addTarget(self, action: #selector(touchDown), for: .touchDown)
        gButton.addTarget(self, action: #selector(touchDown), for: .touchDown)
        
        aButton.tag = 0
        bButton.tag = 1
        cButton.tag = 2
        dButton.tag = 3
        eButton.tag = 4
        fButton.tag = 5
        gButton.tag = 6
        
        view.addSubview(aButton)
        view.addSubview(bButton)
        view.addSubview(cButton)
        view.addSubview(dButton)
        view.addSubview(eButton)
        view.addSubview(fButton)
        view.addSubview(gButton)
    }
    func setupContraints(){
        
        aButton.translatesAutoresizingMaskIntoConstraints = false
        cButton.translatesAutoresizingMaskIntoConstraints = false
        dButton.translatesAutoresizingMaskIntoConstraints = false
        bButton.translatesAutoresizingMaskIntoConstraints = false
        eButton.translatesAutoresizingMaskIntoConstraints = false
        fButton.translatesAutoresizingMaskIntoConstraints = false
        gButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Upper Left Button
        let aButtonXConstraint = NSLayoutConstraint(item: self.aButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 0.4, constant: 0)
        let aButtonYConstraint = NSLayoutConstraint(item: self.aButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 0.85, constant: 0)
        let aButtonHeight = NSLayoutConstraint(item: self.aButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let aButtonWidth = NSLayoutConstraint(item: self.aButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([aButtonXConstraint,aButtonYConstraint,aButtonHeight,aButtonWidth])
        
        // Upper Center Button
        let bButtonXConstraint = NSLayoutConstraint(item: self.bButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let bButtonYConstraint = NSLayoutConstraint(item: self.bButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 0.52, constant: 0)
        let bButtonHeight = NSLayoutConstraint(item: self.bButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let bButtonWidth = NSLayoutConstraint(item: self.bButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([bButtonXConstraint,bButtonYConstraint,bButtonWidth,bButtonHeight])
        
        // Center Button
        let cButtonXConstraint = NSLayoutConstraint(item: self.cButton, attribute: .centerX, relatedBy: .equal,
                                                   toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let cButtonYConstraint = NSLayoutConstraint(item: self.cButton, attribute: .centerY, relatedBy: .equal,
                                                   toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        let cButtonHeight = NSLayoutConstraint(item: self.cButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let cButtonWidth = NSLayoutConstraint(item: self.cButton, attribute: .width, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([cButtonXConstraint,cButtonYConstraint,cButtonHeight,cButtonWidth])
        
        // Upper Right Button
        let dButtonXConstraint = NSLayoutConstraint(item: self.dButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 1.52, constant: 0)
        let dButtonYConstraint = NSLayoutConstraint(item: self.dButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 0.85, constant: 0)
        let dButtonHeight = NSLayoutConstraint(item: self.dButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let dButtonWidth = NSLayoutConstraint(item: self.dButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([dButtonXConstraint,dButtonYConstraint,dButtonWidth,dButtonHeight])
        
        // Bottom Left Button
        let eButtonXConstraint = NSLayoutConstraint(item: self.eButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 0.4, constant: 0)
        let eButtonYConstraint = NSLayoutConstraint(item: self.eButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 1.23, constant: 0)
        let eButtonHeight = NSLayoutConstraint(item: self.eButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let eButtonWidth = NSLayoutConstraint(item: self.eButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([eButtonXConstraint,eButtonYConstraint,eButtonHeight,eButtonWidth])
        
        // Bottom Center Button
        let fButtonXConstraint = NSLayoutConstraint(item: self.fButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let fButtonYConstraint = NSLayoutConstraint(item: self.fButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 1.47, constant: 0)
        let fButtonHeight = NSLayoutConstraint(item: self.fButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let fButtonWidth = NSLayoutConstraint(item: self.fButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([fButtonXConstraint,fButtonYConstraint,fButtonWidth,fButtonHeight])
        
        // Bottom Right Button
        let gButtonXConstraint = NSLayoutConstraint(item: self.gButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 1.52, constant: 0)
        let gButtonYConstraint = NSLayoutConstraint(item: self.gButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 1.23, constant: 0)
        let gButtonHeight = NSLayoutConstraint(item: self.gButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let gButtonWidth = NSLayoutConstraint(item: self.gButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([gButtonXConstraint,gButtonYConstraint,gButtonWidth,gButtonHeight])
        
    }

}


