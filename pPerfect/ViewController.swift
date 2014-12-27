//
//  ViewController.swift
//  pPerfect
//
//  Created by Mukiza Andrew on 12/27/14.
//  Copyright (c) 2014 Mukiza Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordinLabel: UILabel!
    @IBOutlet weak var stopBtn: UIButton!
    
    @IBAction func RecordAudio(sender: UIButton) {
        recordinLabel.hidden = false
        stopBtn.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

