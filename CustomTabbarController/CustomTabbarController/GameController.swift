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
    
    func comparePlayedSound(pressedButtonindex: Int ) -> Bool {
        if lastPlaySoundIndex == pressedButtonindex { return true }
        else { return false }
        }
    
    func updateLivesWith(buttonPressedIndex: Int){
        if comparePlayedSound(pressedButtonindex: buttonPressedIndex) == true {
            self.lifes += 1
        } else {
            self.lifes -= 1
        }
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
