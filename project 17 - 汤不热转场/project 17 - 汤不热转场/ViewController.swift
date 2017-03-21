//
//  ViewController.swift
//  project 17 - 汤不热转场
//
//  Created by mk on 17/3/21.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}

