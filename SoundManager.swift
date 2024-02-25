//
//  SoundManager.swift
//  DING!
//
//  Created by Febrian Daniel on 25/02/24.
//

import Foundation
import AVFoundation

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    enum sounds: String {
        case sol = "120ml (sol)"
        case fa = "220ml (fa)"
        case mi = "250ml (mi)"
        case re = "300ml (re)"
        case doo = "350ml (do)"
        case soal1 = "soal 1"
        case soal2 = "soal 2"
        case soal3 = "soal 3"
    }
    
    func playSound(sound: sounds) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "m4a") else {
            print("error")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    func playSoundSoal(sound: sounds) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else {
            print("error")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}
