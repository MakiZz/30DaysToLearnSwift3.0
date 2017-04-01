//
//  RotationViewController.swift
//  project  25 - 基础动画
//
//  Created by mk on 17/4/1.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    
    let emojiLabel = UILabel()
    let rotationImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        emojiLabel.frame = CGRect.init(x: 137, y: 274, width: 100, height: 120)
        emojiLabel.text = "💩"
        emojiLabel.font = UIFont.systemFont(ofSize: 80)
        self.view.addSubview(emojiLabel)
        
    }

    
    func spin() {
        
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear, animations: { 
            
            self.emojiLabel.transform = CGAffineTransform.rotated(self.emojiLabel.transform)(by: CGFloat(M_PI))
            }) { (finished) in
                self.spin()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.spin()
    }
    
    
}
