//
//  ViewController.swift
//  stopWatch
//
//  Created by mk on 17/3/9.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    var Counter = 0.0;
    var timer = Timer();
    var IsPlaying = false
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(Counter)
        
    }

    @IBAction func playButtonDidTouch(_ sender: AnyObject) {
        if IsPlaying {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        IsPlaying = true
        
    
    }

    @IBAction func pauseButtonDidTouch(_ sender: AnyObject) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        IsPlaying = false
    
    }
    @IBAction func ResetAction(_ sender: AnyObject) {
        timer.invalidate()
        IsPlaying = false
        Counter = 0
        timeLabel.text = String(Counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    func UpdateTimer() {
        Counter = Counter + 0.1
        timeLabel.text = String(format:"%.1f",Counter);
    }
    
}

