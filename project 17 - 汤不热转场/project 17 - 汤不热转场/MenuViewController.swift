//
//  MenuViewController.swift
//  project 17 - 汤不热转场
//
//  Created by mk on 17/3/21.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let transitionManager = MenuTransitionManager()
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var audioButton: UIButton!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return UIStatusBarStyle.lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.transitionManager
        
        
    }

   

}
