//
//  OpacityViewController.swift
//  project  25 - 基础动画
//
//  Created by mk on 17/4/1.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {

    var view1 = UIView()
    var view2 = UIView()
    var view3 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view1.frame = CGRect.init(x: 30, y: 94, width: 100, height: 100)
        view2.frame = CGRect.init(x: 245, y: 94, width: 100, height: 100)
        view3.frame = CGRect.init(x: 87, y: 219, width: 200, height: 20)
        view1.backgroundColor = UIColor.black
        view2.backgroundColor = UIColor.black
        view3.backgroundColor = UIColor.black
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(view3)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: { 
            
            self.view1.center.x = self.view.bounds.width - self.view1.center.x
            self.view1.center.y += 30
            self.view2.center.x = self.view.bounds.width - self.view2.center.x
            self.view2.center.y += 30
            
            }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: { 
            self.view3.frame.size.height = 100
            self.view3.center.y = self.view.bounds.height - self.view3.center.y
            }, completion: nil)
        
        
    }

    
}
