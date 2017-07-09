//
//  SoundFilesPath.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/5/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation
import AVFoundation

struct PianoSoundFilesPath {
    
    var soundPlayer:AVAudioPlayer = AVAudioPlayer()
    
    let gSoundPath = Bundle.main.path(forResource: "g", ofType: "wav")
    let gSharpPath = Bundle.main.path(forResource: "gsharp", ofType: "wav")
    let fSharpPath = Bundle.main.path(forResource: "fsharp", ofType: "wav")
    let fSoundPath = Bundle.main.path(forResource: "f", ofType: "wav")
    let eFlatSoundPath = Bundle.main.path(forResource: "eflat", ofType: "wav")
    let eSoundPath = Bundle.main.path(forResource: "e", ofType: "wav")
    let dSoundPath = Bundle.main.path(forResource: "d", ofType: "wav")
    let cSoundPath = Bundle.main.path(forResource: "c", ofType: "wav")
    let cSharpPath = Bundle.main.path(forResource: "csharp", ofType: "wav")
    let bFlatPath = Bundle.main.path(forResource: "bflat", ofType: "wav")
    let bSoundPath = Bundle.main.path(forResource: "b", ofType: "wav")
    let ASoundPath = Bundle.main.path(forResource: "a", ofType: "wav")
    
}
