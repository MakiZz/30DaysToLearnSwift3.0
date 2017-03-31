//
//  ViewController.swift
//  project 23 - SlideMenu
//
//  Created by mk on 17/3/30.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var homeViewController: HomeViewController!
    
    var distance: CGFloat = 0
    
    let FullDistance: CGFloat = 0.78
    let Proportion: CGFloat = 0.77
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView.init(image: UIImage.init(named: "cola"))
        imageView.frame = UIScreen.main.bounds
        self.view.addSubview(imageView)
        
        homeViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.view.addSubview(homeViewController.view)
        
        homeViewController.panGesture.addTarget(self, action: #selector(pan))
        
        
    }

     func pan(recongnizer: UIPanGestureRecognizer) {
        let x = recongnizer.translation(in: self.view).x
        let trueDistance = distance + x
        
        if recongnizer.state == UIGestureRecognizerState.ended {
            
            if trueDistance > Common.screenWidth * (Proportion / 3) {
                showLeft()
            }else if trueDistance < Common.screenWidth * -(Proportion / 3) {
                showRight()
            }else {
                showHome()
            }
            return
        }
        
        var proportion: CGFloat = recongnizer.view!.frame.origin.x >= 0 ? -1 : 1
        proportion *= trueDistance / Common.screenWidth
        proportion *= 1 - Proportion
        proportion /= 0.6
        proportion += 1
        if proportion <= Proportion {
            return
        }
        
        recongnizer.view?.center = CGPoint.init(x: self.view.center.x + trueDistance, y: self.view.center.y)
        recongnizer.view?.transform = CGAffineTransform.identity.scaledBy(x: proportion, y: proportion)
        
    }
    
    func showRight () {
        distance = self.view.center.x * -(FullDistance + Proportion / 2)
        doTheAnimate(proportion: self.Proportion)
    }
    
    
    func showLeft() {
        distance = self.view.center.x * (FullDistance + Proportion / 2)
        doTheAnimate(proportion: self.Proportion)
    }
    
    func showHome() {
        distance = 0
        doTheAnimate(proportion: 1)
    }
    
    
    
    func doTheAnimate(proportion: CGFloat) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: { 
            self.homeViewController.view.center = CGPoint.init(x: self.view.center.x + self.distance, y: self.view.center.y)
            self.homeViewController.view.transform = CGAffineTransform.identity.scaledBy(x: proportion, y: proportion)
            
            }, completion: nil)
        
        
    }
    

}

