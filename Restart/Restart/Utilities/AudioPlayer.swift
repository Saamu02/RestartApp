//
//  AudioPlayer.swift
//  Restart
//
//  Created by Ussama Irfan on 21/06/2024.
//

import AVFoundation

class AudioPlayer {
    
    public static var shared = AudioPlayer()
    
    private init() { }
    
    private var audioPlayer: AVAudioPlayer?
    
    func playSound(sound: String, type: String = "mp3") {
        
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
                
            } catch {
                print("Could not play the sound file.")
            }
        }
    }
    
}
