//
//  ViewController.swift
//  project 12 - 登录动画
//
//  Created by mk on 17/3/16.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 0, green: 177.0/255, blue: 48.0/255, alpha: 1.0)
        setup()
        
    }
}

extension ViewController{

    func setup() {
        
        let imageView = UIImageView.init(frame: .init(x: 78, y: 150, width: 218, height: 66))
        imageView.image = #imageLiteral(resourceName: "login-secondary-logo")
        self.view.addSubview(imageView)
        
        let button = UIButton()
        button.frame = CGRect.init(x: 30, y: 550, width: 315, height: 50)
        button.backgroundColor = UIColor.white
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.init(red: 0, green: 177.0/255, blue: 48.0/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        self.view.addSubview(button)

    }
    
    func loginAction() {
        
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
        
    }
    

    
}
