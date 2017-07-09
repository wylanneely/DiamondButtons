//
//  GameController.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/5/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation
import AVFoundation

class GameController {
    
    static var shared = GameController()
    
    var gameMode: String = "Default"
    var lastPlaySoundIndex: Int?
    var lifes: Int = 5
    var score: Int = 0
    var isPlaying: Bool = false
    
    var soundPlayer = AVAudioPlayer()
    
    func getPlaySoundIndex(){
        let randomIndex = Int(arc4random_uniform(6))
        self.lastPlaySoundIndex = randomIndex
        self.isPlaying = true
    }
    
    
    
    func setNumberOfLifes(int: Int) {
        lifes = int
    }
    
  @discardableResult  func compareSoundToPlayedSound(buttonPressedIndex: Int ) -> Bool{
        if lastPlaySoundIndex == buttonPressedIndex { score += 1; return true }
       if lastPlaySoundIndex != buttonPressedIndex { lifes -= 1; return true }
    if self.gameMode == "Streak" {
        if lastPlaySoundIndex != buttonPressedIndex {
            self.score = 0; return true } }; return true }
    
    func updateGameMode(mode: String){
        gameMode = mode
    }
    
    func isAlive() -> Bool{
        if lifes == 0 {return false}
        else {
            return true
        }
    }
    
    func resetGame(){
        self.lifes = 3
        self.score = 0
        self.lastPlaySoundIndex = nil
    }
    
    
    
    
}
