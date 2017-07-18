//
//  HighScoreController.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/18/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation


class HighScoreController {
    
    init() {
       let mock = HighScore(name: "Yolo", lives: 0, score: 0)
        self.highScores = [mock,mock,mock,mock,mock]
    }
    
    static var shared = HighScoreController()
    
    var highScores: [HighScore]
    
    func compareAndSave(newHighScore: HighScore) {
        var indexOfHighScore = 0
        
        for highScore in highScores {
            if highScore.score <= newHighScore.score {
                highScores.insert(newHighScore, at: indexOfHighScore)
                highScores.remove(at: 5)
                return
            }
            indexOfHighScore += 1
        }
    }
    
    func isNewHighScoreAHighScore(newScore: Int) -> Bool {
        
        
        let highScore1 = highScores[0]
        let highScore2 = highScores[1]
        let highScore3 = highScores[2]
        let highScore4 = highScores[3]
        let highScore5 = highScores[4]
        
        if newScore > highScore1.score { return true }
        if newScore > highScore2.score { return true }
        if newScore > highScore3.score { return true }
        if newScore > highScore4.score { return true }
        if newScore >= highScore5.score{ return true } else { return false }
        
        
    }
}

class HighScore {
    
    init(name: String, lives: Int, score: Int) {
        self.name = name
        self.lives = lives
        self.score = score
    }
    
    var lives: Int
    var score: Int
    var name: String
}
