//
//  GuitarSoundsFilePath.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/9/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation
import AVFoundation

struct GuitarMajorChords {
    
    var soundPlayer:AVAudioPlayer = AVAudioPlayer()
    
    let gSoundPath = Bundle.main.path(forResource: "GMajorGuitarChord", ofType: "wav")
    let fSoundPath = Bundle.main.path(forResource: "FMajorGuitarChord", ofType: "wav")
    let eSoundPath = Bundle.main.path(forResource: "EMajorGuitarChord", ofType: "wav")
    let dSoundPath = Bundle.main.path(forResource: "DMajorGuitarChord", ofType: "wav")
    let cSoundPath = Bundle.main.path(forResource: "CMajorGuitarChord", ofType: "wav")
    let bSoundPath = Bundle.main.path(forResource: "BMajorGuitarChord", ofType: "wav")
    let ASoundPath = Bundle.main.path(forResource: "AMajorGuitarChord", ofType: "wav")
    
}
