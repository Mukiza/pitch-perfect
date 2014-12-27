//
//  RecordSoundsViewController.swift
//  pPerfect
//
//  Created by Mukiza Andrew on 12/27/14.
//  Copyright (c) 2014 Mukiza Andrew. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordinLabel: UILabel!
    @IBOutlet weak var stopBtn: UIButton!
    var audioRecorder:AVAudioRecorder!
    var recordedAudio : RecordedAudio!
    
    @IBAction func RecordAudio(sender: UIButton) {
        recordinLabel.hidden = false
        stopBtn.hidden = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime) + ".wav"
        let pathArray = [dirPath, recordingName]
        
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)

        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.record()
    }
    
    @IBAction func StopRecorder(sender: UIButton) {
        recordinLabel.hidden = true

        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "stopRecordingAudio" {
            let playSoundVc : PlaySoundViewController = segue.destinationViewController as
                PlaySoundViewController
            let data = sender as RecordedAudio
                playSoundVc.recievedAudio = data
        }
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if flag {
            recordedAudio = RecordedAudio()
            recordedAudio.filePathUrl = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            self.performSegueWithIdentifier("stopRecordingAudio", sender: recordedAudio)
        }else{
            println("Damn it didnt work")
        }
    }
}

