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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
        var filePathUrl = NSURL.fileURLWithPath(filePath)
        audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
        }else{
            println("Oops the file path didn't get us stuff")
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func PlaySoundFast(sender: UIButton) {
        playSoundAt(1.5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PlaySlowly(sender: UIButton) {
        playSoundAt(0.5)
    }

    @IBAction func StopAudioPlayback(sender: UIButton) {
        audioPlayer.stop()
    }

    func playSoundAt(rate: Float){
        audioPlayer.stop()
        audioPlayer.enableRate = true
        audioPlayer.currentTime = 0.0
        audioPlayer.rate = rate
        audioPlayer.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
