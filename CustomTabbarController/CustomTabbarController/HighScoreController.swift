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
       let mock = HighScore(name: "Steve Jobs", lives: 3, score: 5)
        let mock1 = HighScore(name: "Micheal Phelps", lives: 1, score: 10)
        let mock2 = HighScore(name: "Elon Musk", lives: 5, score: 2)
        
        self.highScores = [mock1,mock,mock2]
        loadFromUserDefaults()
    }
    
    static var shared = HighScoreController()
    
    static fileprivate let kHighscores = "HighscoresKey"
    var highScores: [HighScore]
    
    func compareAndSave(newHighScore: HighScore) {
        var indexOfHighScore = 0
        
        for highScore in highScores {
            if highScore.score <= newHighScore.score {
                highScores.insert(newHighScore, at: indexOfHighScore)
                highScores.remove(at: 3)
                saveToUserDefauls()
                return
            }
            indexOfHighScore += 1
        }
    }
    
    func isNewHighScoreAHighScore(newScore: Int) -> Bool {
        
        let highScore1 = highScores[0]
        let highScore2 = highScores[1]
        let highScore3 = highScores[2]
        
        if newScore > highScore1.score { return true }
        if newScore > highScore2.score { return true }
        if newScore >= highScore3.score { return true } else { return false }
        
    }
    
    //MARK: - Persistance
    func saveToUserDefauls() {
        let userDefaults = UserDefaults.standard
        let highscoreDictionaries = highScores.map({$0.dictionaryRep})
        userDefaults.set(highscoreDictionaries, forKey: HighScoreController.kHighscores)
    }
    
    func loadFromUserDefaults() {
        let userDefaults = UserDefaults.standard
        guard let highscoreDictionaries = userDefaults.object(forKey:HighScoreController.kHighscores) as? [[String:Any]]
            else {return}
        highScores = highscoreDictionaries.flatMap({ HighScore(dictionary: $0) })
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
    
    static fileprivate let kName = "nameKey"
    static fileprivate let kLives = "livesKey"
    static fileprivate let kScore = "scoreKey"
    
    var dictionaryRep: [String:Any] {
        return[HighScore.kName: name, HighScore.kLives: lives, HighScore.kScore: score]
    }
    
    convenience init?(dictionary: [String:Any]) {
        guard let name = dictionary[HighScore.kName] as? String,
            let lives = dictionary[HighScore.kLives] as? Int,
            let score = dictionary[HighScore.kScore] as? Int
            else {return nil}
       self.init(name: name, lives: lives, score: score)
    }
    
}


















