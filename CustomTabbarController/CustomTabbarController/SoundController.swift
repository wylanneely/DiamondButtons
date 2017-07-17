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
    
    static var shared = SoundController()
       var soundPlayer:AVAudioPlayer = AVAudioPlayer()
 
    var pianoSoundFilePath = PianoSoundFilesPath()
    var guitarSoundFilePath = GuitarMajorChords()

    var isGuitarSound: AudioFilePath = .pianoSounds
    
    
    mutating func playSoundWith(noteIndex: Int) {
        
        if isGuitarSound == .pianoSounds {
        guard let gSoundPath = pianoSoundFilePath.gSoundPath,
            let fSoundPath = pianoSoundFilePath.fSoundPath,
            let eSoundPath = pianoSoundFilePath.eSoundPath,
            let dSoundPath = pianoSoundFilePath.dSoundPath,
            let cSoundPath = pianoSoundFilePath.cSoundPath,
            let bSoundPath = pianoSoundFilePath.bSoundPath,
            let ASoundPath = pianoSoundFilePath.ASoundPath else { print("error getting soundsFilePath"); return }
        
        let soundsArray = [ASoundPath,bSoundPath,cSoundPath,dSoundPath,eSoundPath,fSoundPath,gSoundPath]
        let soundPath = soundsArray[noteIndex]
        do {
            try soundPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: soundPath) as URL, fileTypeHint: "wav")
            soundPlayer.play()
        } catch {}
        }
        
        if isGuitarSound == .guitarMajorChords {
            guard let gSoundPath = guitarSoundFilePath.gSoundPath,
                let fSoundPath = guitarSoundFilePath.fSoundPath,
                let eSoundPath = guitarSoundFilePath.eSoundPath,
                let dSoundPath = guitarSoundFilePath.dSoundPath,
                let cSoundPath = guitarSoundFilePath.cSoundPath,
                let bSoundPath = guitarSoundFilePath.bSoundPath,
                let ASoundPath = guitarSoundFilePath.ASoundPath else { print("error getting soundsFilePath"); return }
            
            let soundsArray = [ASoundPath,bSoundPath,cSoundPath,dSoundPath,eSoundPath,fSoundPath,gSoundPath]
            let soundPath = soundsArray[noteIndex]
            do {
                try soundPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: soundPath) as URL, fileTypeHint: "wav")
                soundPlayer.play()
            } catch {}
        }
}
    
    
    
}

enum AudioFilePath: String {
    case guitarMajorChords = "guitarMajorChords"
    case pianoSounds = "pianoSounds"
}
