//
//  PlaySoundViewController.swift
//  pPerfect
//
//  Created by Mukiza Andrew on 12/27/14.
//  Copyright (c) 2014 Mukiza Andrew. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer!
    var recievedAudio : RecordedAudio!
    var audioEngine : AVAudioEngine!
    var audioFile : AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = AVAudioPlayer(contentsOfURL: recievedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: recievedAudio.filePathUrl, error: nil)
    }

    @IBAction func PlaySoundFast(sender: UIButton) {
        playSoundAt(1.5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func PlayWithChimpmunkEffect(sender: UIButton) {
        playAudioWith(1000)
    }
    
    @IBAction func PlaySlowly(sender: UIButton) {
        playSoundAt(0.5)
    }

    @IBAction func StopAudioPlayback(sender: UIButton) {
        audioPlayer.stop()
    }

    @IBAction func PlayWithDarthVarderEffect(sender: UIButton) {
        playAudioWith(-1000)
    }
    
    func playSoundAt(rate: Float){
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        audioPlayer.rate = rate
        audioPlayer.play()
    }
    
    
    func playAudioWith(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var audioPitchEffect = AVAudioUnitTimePitch()
        audioPitchEffect.pitch = pitch
        audioEngine.attachNode(audioPitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: audioPitchEffect, format: nil)
        audioEngine.connect(audioPitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }

}
