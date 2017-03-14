//
//  ViewController.swift
//  project 10 - 视频背景
//
//  Created by mk on 17/3/14.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
    }
    
    func setupVideoBackground() {
        let url = NSURL.init(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        contentURL = url
        
        view.isUserInteractionEnabled = false
        
    }
    

    @IBAction func LoginAction(_ sender: AnyObject) {
    }

    @IBOutlet weak var SignUpAction: UIButton!
}

