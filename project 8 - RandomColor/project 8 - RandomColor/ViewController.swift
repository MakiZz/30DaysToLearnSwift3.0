//
//  ViewController.swift
//  project 8 - RandomColor
//
//  Created by mk on 17/3/13.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer.init()
    
    let gradientLayer = CAGradientLayer()
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.shared.isStatusBarHidden = true
        
    }
    @IBAction func playAction(_ sender: AnyObject) {
        
//        let bgMusic = NSURL.init(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        let bgMusic = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer.init(contentsOf: bgMusic)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
            
        } catch let audioError as NSError {
            print(audioError)
        }
        
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
        }
        
        let redValue = CGFloat(drand48())
        let blueValue = CGFloat.init(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        gradientLayer.frame = view.bounds
        
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor
        
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer)
        
        
    }
    
    
    func randomColor() {
        
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
    }
    

}

