//
//  AudioSampler.swift
//  PIT Drum
//
//  Created by Pedro Moreno on 03/10/2021.
//  Copyright © 2020 Pedro M. Moreno. All rights reserved.
//

import Foundation
import AudioKit
import AVFAudio

///
/// AudioSampleris the drum sampler engine. It manages the audio elements included in the sampler:
///   * Kick Drum.
///   * Snare.
///   * Hi-hat.
///   * Crashes.
///   * Toms.
///   *  Cymbal
///
/// - Author: Pedro M. Moreno
/// - Date: 03/10/2021. 
///
open class AudioSampler {
    /* VARIABLES */
    
    /* Engine */
    var engine: AudioEngine!
   
    /* Sampler */
    var sampler: AppleSampler!
   
    /* Constants */
    let FILE_EXTENSION = "wav"
  
    // Files
    let KICK_FILE = "1_kickC1"
    let SNARE_FILE = "2_snareD1"
    let HI_HAT_CLOSED_FILE = "3_hi-hat_closedE1"
    let CRASH_1_FILE = "4_crash_1F1"
    let CRASH_2_FILE = "5_crash_2G1"
    let CRASH_3_FILE = "6_crash_3A1"
    let TOM_1_FILE = "7_tom_1B1"
    let TOM_2_FILE = "8_tom_2C2"
    let CYMBAL_FILE = "9_cymbalD2"
    let HI_HAT_OPEN_FILE = "10_hi-hat_openE2"
    
    /* ERRORS */
    let ERROR_1 = "ERROR: File not found."
    let ERROR_2 = "ERROR: The button doesn't exist. Check tags in Main.storyboard.swif"

    
    /* init */
        /// Inittialises AudioKit's engine and the sampler audio files's oscillator.
        ///
    init(){
        let kickFile: AVAudioFile = getFile(name: KICK_FILE)
        let snareFile: AVAudioFile = getFile(name: SNARE_FILE)
        let closedHatFile: AVAudioFile = getFile(name: HI_HAT_CLOSED_FILE)
        let crash1File: AVAudioFile = getFile(name: CRASH_1_FILE)
        let crash2File: AVAudioFile = getFile(name: CRASH_2_FILE)
        let crash3File: AVAudioFile = getFile(name: CRASH_3_FILE)
        let tom1File: AVAudioFile = getFile(name: TOM_1_FILE)
        let tom2File: AVAudioFile = getFile(name: TOM_2_FILE)
        let cymbalFile: AVAudioFile = getFile(name: CYMBAL_FILE)
        let openHatFile: AVAudioFile = getFile(name: HI_HAT_OPEN_FILE)
        
        
        let audioFiles: [AVAudioFile] = [kickFile, snareFile, closedHatFile, crash1File, crash2File, crash3File, tom1File, tom2File, cymbalFile, openHatFile]
        sampler = AppleSampler()
        try! sampler.loadAudioFiles(audioFiles)
        
        engine = AudioEngine()
        engine.output = sampler
        try! engine.start()
    }
    
    /* func getFile */
        /// Looks for the file passed as argument and returns the file as an AVAudioFile object.
        ///
    func getFile(name: String) -> AVAudioFile {
        guard let filePath = Bundle.main.url(forResource: name, withExtension: FILE_EXTENSION)
        else {
            print (ERROR_1 + name)
            return AVAudioFile()
        }
        
        let fileExists = try! filePath.checkResourceIsReachable()
        var file: AVAudioFile
        if !fileExists {
            print (ERROR_1 + name)
        }
        file = try! AVAudioFile(forReading: filePath)
        
        return file
    }
    
    /* func playSample */
        /// Handles the sampler playback.
        ///
    func playSample(tag: Int){
        switch tag {
        case 1:
            sampler.play(noteNumber: 24, velocity: 127, channel: 1)
        case 2:
            sampler.play(noteNumber: 26, velocity: 127, channel: 1)
        case 3:
            sampler.play(noteNumber: 28, velocity: 127, channel: 1)
        case 4:
            sampler.play(noteNumber: 29, velocity: 127, channel: 1)
        case 5:
            sampler.play(noteNumber: 31, velocity: 127, channel: 1)
        case 6:
            sampler.play(noteNumber: 33, velocity: 127, channel: 1)
        case 7:
            sampler.play(noteNumber: 35, velocity: 127, channel: 1)
        case 8:
            sampler.play(noteNumber: 36, velocity: 127, channel: 1)
        case 9:
            sampler.play(noteNumber: 38, velocity: 127, channel: 1)
        case 10:
            sampler.play(noteNumber: 40, velocity: 127, channel: 1)
        default:
            print(ERROR_2)
        }
    }
}
