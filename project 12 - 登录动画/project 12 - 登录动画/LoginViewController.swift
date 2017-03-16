//
//  LoginViewController.swift
//  project 12 - 登录动画
//
//  Created by mk on 17/3/16.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let userNameTextField = UITextField.init()
    var passwordTextField : UITextField!
    var loginBtn : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0, green: 177.0/255, blue: 48.0/255, alpha: 1.0)
        
        
        userNameTextField.placeholder = " username"
        userNameTextField.layer.cornerRadius = 5
        userNameTextField.backgroundColor = UIColor.white
        view.addSubview(userNameTextField)
        
        passwordTextField = UITextField.init()
        passwordTextField.frame = .init(x: -315, y: 220, width: 315, height: 50)
        passwordTextField.placeholder = " password"
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.backgroundColor = UIColor.white
        view.addSubview(passwordTextField)
        
        loginBtn = UIButton.init()
        loginBtn.frame = .init(x: 100, y: 290, width: 175, height: 40)
        loginBtn.setTitle("login", for: .normal)
        loginBtn.backgroundColor = UIColor.init(red: 0, green: 136/255.0, blue: 35/255.0, alpha: 1)
        loginBtn.alpha = 0
        loginBtn.layer.cornerRadius = 5
        loginBtn.addTarget(self, action: #selector(loginAction(sender:)), for: .touchUpInside)
        view.addSubview(loginBtn)
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.frame = .init(x: -315, y: 150, width: 315, height: 50)
        passwordTextField.frame = .init(x: -315, y: 220, width: 315, height: 50)
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.00, options: .curveEaseOut, animations: { 
            self.userNameTextField.frame.origin.x = 30
            
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.10, options: .curveEaseOut, animations: {
            self.passwordTextField.frame.origin.x = 30
            
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.20, options: .curveEaseOut, animations: { 
            
            self.loginBtn.alpha = 1
            
            }, completion: nil)
        
    }
    
    func loginAction(sender:UIButton) {
        let bounds = self.loginBtn.bounds
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveLinear, animations: { 
            
            self.loginBtn.bounds.origin.x = bounds.origin.x - 20
            self.loginBtn.bounds.size.width = bounds.size.width + 60
            self.loginBtn.isEnabled = false
            
            }) { (finished) in
                self.loginBtn.isEnabled = true
        }
        
    }
    
    
}
