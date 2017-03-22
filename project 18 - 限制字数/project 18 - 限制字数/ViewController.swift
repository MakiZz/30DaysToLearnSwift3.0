//
//  ViewController.swift
//  project 18 - 限制字数
//
//  Created by mk on 17/3/21.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextViewDelegate,UITextFieldDelegate{

    
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tweetTextView.delegate = self
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        
        tweetTextView.backgroundColor = UIColor.clear
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardWillShow(note:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardWillHide(note:)), name: .UIKeyboardWillHide, object: nil)
        
        
    }

    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let myTextViewString = tweetTextView.text!
        countLabel.text = "\(140 - myTextViewString.characters.count)"
        
        if range.length > 140 {
            
            return false
        }
        
        let newLength = myTextViewString.characters.count + range.length
        
        return newLength < 140
    }
    
    

    func keyBoardWillShow(note:NSNotification) {
        
        let userInfo = note.userInfo
        let keyBoardBounds = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let deltay = keyBoardBounds.size.height
        
        let animation:(() -> Void) = {
            
            self.bottomView.transform = CGAffineTransform.init(translationX: 0, y: -deltay)
            
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions.init(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animation, completion: nil)
        }else {
            animation()
        }
    }
    
    
    
    func keyBoardWillHide(note:NSNotification) {
        
        
        let userInfo = note.userInfo
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let animations:(() -> Void) = {
            
            self.bottomView.transform = CGAffineTransform.identity
            
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions.init(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        }else{
            animations()
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    

}

