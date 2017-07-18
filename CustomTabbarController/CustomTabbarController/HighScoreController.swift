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
       let mock = HighScore(name: "Yolo", lives: 0, score: 3)
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
        
        for score in highScores {
            if newScore >= score.score { return true }
        }
        return false
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
