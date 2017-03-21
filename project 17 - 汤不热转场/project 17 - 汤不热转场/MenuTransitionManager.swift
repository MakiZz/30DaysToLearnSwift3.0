//
//  MenuTransitionManager.swift
//  project 17 - 汤不热转场
//
//  Created by mk on 17/3/21.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject,UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate {

    private var presenting = false
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView
        
        let screens : (from:UIViewController, to: UIViewController) = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!,transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!)
        
        let menuViewController = !self.presenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
        
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        if self.presenting {
           
            self.offStageMenuController(menuViewController: menuViewController)
        }
    
        container.addSubview(bottomView!)
        container.addSubview(menuView!)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: { 
            
            if self.presenting{
                self.onStageMenuController(menuViewController: menuViewController)
            }else{
                self.offStageMenuController(menuViewController: menuViewController)
            }
            
            
            }) { (finished) in
                transitionContext.completeTransition(true)
                UIApplication.shared.keyWindow?.addSubview(screens.to.view)
        }
        
        
        
    }
    
    func offstage(amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransform.init(translationX: amount, y: 0)
    }
    
    
    func offStageMenuController(menuViewController: MenuViewController) {
        
        menuViewController.view.alpha = 0
        
        let topRowOffset : CGFloat = 300
        let middleRowOffset : CGFloat = 150
        let bottomRowOffset : CGFloat = 50
    
        menuViewController.textButton.transform = self.offstage(amount: -topRowOffset)

        
        menuViewController.quoteButton.transform = self.offstage(amount: -middleRowOffset)

        
        menuViewController.chatButton.transform = self.offstage(amount:-bottomRowOffset)

        
        menuViewController.photoButton.transform = self.offstage(amount:topRowOffset)
 
        
        menuViewController.linkButton.transform = self.offstage(amount:middleRowOffset)

        
        menuViewController.audioButton.transform = self.offstage(amount:bottomRowOffset)

        
    }
    
    func onStageMenuController(menuViewController: MenuViewController) {
        
        menuViewController.view.alpha = 1
        
        menuViewController.textButton.transform = CGAffineTransform.identity
        menuViewController.quoteButton.transform = CGAffineTransform.identity
        menuViewController.chatButton.transform = CGAffineTransform.identity
        menuViewController.photoButton.transform = CGAffineTransform.identity
        menuViewController.linkButton.transform = CGAffineTransform.identity
        menuViewController.audioButton.transform = CGAffineTransform.identity
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = false
        return self
    }
    
    
    
    
    
}
