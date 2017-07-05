//
//  SoundController.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/5/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation
import AVFoundation

struct SoundController {
    
    let sound = SoundFilesPath()
    var soundPlayer:AVAudioPlayer = AVAudioPlayer()
    
    mutating func playSoundWith(noteIndex: Int) {
        
        guard let gSoundPath = sound.gSoundPath,
            let fSoundPath = sound.fSoundPath,
            let eSoundPath = sound.eSoundPath,
            let dSoundPath = sound.dSoundPath,
            let cSoundPath = sound.cSoundPath,
            let bSoundPath = sound.bSoundPath,
            let ASoundPath = sound.ASoundPath else { print("error getting soundsFilePath"); return }
        
        let soundsArray = [ASoundPath,bSoundPath,cSoundPath,dSoundPath,eSoundPath,fSoundPath,gSoundPath]
        
        let soundPath = soundsArray[noteIndex]
        
        do {
            try soundPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: soundPath) as URL, fileTypeHint: "wav")
            soundPlayer.play()
        } catch {}
        
}
}

