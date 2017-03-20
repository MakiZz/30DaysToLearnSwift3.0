//
//  ViewController.swift
//  project 15 - 扩散动画
//
//  Created by mk on 17/3/20.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UIViewController , CAAnimationDelegate {

    var mask = CALayer()
    var bgImage = UIImageView()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        UIApplication.shared.isStatusBarHidden = true

    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        prefersStatusBarHidden
        
        
        UIApplication.shared.isStatusBarHidden = true
        self.view.backgroundColor = UIColor.init(red: 0.117, green: 0.631, blue: 0.949, alpha: 1)
        
        bgImage.image = #imageLiteral(resourceName: "screen")
        bgImage.frame = view.bounds
        self.view.addSubview(bgImage)
        
        mask.contents = UIImage.init(named: "twitter")?.cgImage
        mask.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 81)
        mask.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        mask.position = CGPoint.init(x: bgImage.frame.size.width/2, y: bgImage.frame.size.width/2)
        
        bgImage.layer.mask = mask
        
        maskAnimation()
    }
    
    
    func maskAnimation() {
        
        let keyAnimation = CAKeyframeAnimation.init(keyPath: "bounds")
        keyAnimation.duration = 0.5
        keyAnimation.delegate = self
        keyAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyAnimation.timingFunctions = [CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)]
        
        let firstBounds = NSValue.init(cgRect: mask.bounds)
        let secondBounds = NSValue.init(cgRect: .init(x: 0, y: 0, width: 90, height: 73))
        let finalBounds = NSValue.init(cgRect: .init(x: 0, y: 0, width: 1600, height: 1300))
        keyAnimation.values = [firstBounds,secondBounds,finalBounds]
        keyAnimation.keyTimes = [0,0.3,1]
        
        self.mask.add(keyAnimation, forKey: "bounds")
        
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.bgImage.layer.mask = nil
    }
    
    
    
}

