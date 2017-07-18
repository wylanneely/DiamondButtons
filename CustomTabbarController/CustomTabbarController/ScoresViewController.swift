//
//  ScoresViewController.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/6/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setupHighscoreLabels()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHighscoreLabels()
    }
    
    func setupHighscoreLabels(){
        let highScore1 = HighScoreController.shared.highScores[0]
        let highScore2 = HighScoreController.shared.highScores[1]
        let highScore3 = HighScoreController.shared.highScores[2]
        let highScore4 = HighScoreController.shared.highScores[3]
        let highScore5 = HighScoreController.shared.highScores[4]
        
        self.highScore1.text = "Name: \(highScore1.name) Lives: \(highScore1.lives) Score: \(highScore1.score)"
        self.highScore2.text = "Name: \(highScore2.name) Lives: \(highScore2.lives) Score: \(highScore2.score)"
        self.highScore3.text = "Name: \(highScore3.name) Lives: \(highScore3.lives) Score: \(highScore3.score)"
        self.highScore4.text = "Name: \(highScore4.name) Lives: \(highScore4.lives) Score: \(highScore4.score)"
        self.highScore5.text = "Name: \(highScore5.name) Lives: \(highScore5.lives) Score: \(highScore5.score)"

    }
    
    @IBOutlet weak var highScore1: UILabel!
    @IBOutlet weak var highScore2: UILabel!
    @IBOutlet weak var highScore3: UILabel!
    @IBOutlet weak var highScore4: UILabel!
    @IBOutlet weak var highScore5: UILabel!
    
    
    

}
