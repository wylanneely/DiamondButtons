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
    
    var lastPlaySoundIndex: Int?
    var lifes: Int = 3
    var isPlaying: Bool = false
    var score: Int = 0
    
    let sound = SoundFilesPath()
    var soundPlayer = AVAudioPlayer()
    
    func getPlaySoundIndex(){
        let randomIndex = Int(arc4random_uniform(6))
        self.lastPlaySoundIndex = randomIndex
        self.isPlaying = true
    }
    
    func compareSoundToPlayedSound(buttonPressedIndex: Int ) -> Bool{
        if lastPlaySoundIndex == buttonPressedIndex { score += 1; return true }
        else{ lifes -= 1; return true }
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
