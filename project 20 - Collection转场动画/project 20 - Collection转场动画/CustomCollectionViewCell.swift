//
//  CustomCollectionViewCell.swift
//  project 20 - Collection转场动画
//
//  Created by mk on 17/3/29.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var textView = UITextView()
    var imageView = UIImageView()
    var backBtn = UIButton()
    
    
    var backBtnBlcok: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        imageView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: 150)
        textView.frame = CGRect.init(x: 0, y: 150, width: self.bounds.width, height: 50)
    }
    
    func setcellContentView(model : AnimationCellModel) {
        imageView.image = UIImage.init(named: model.imageName)
        backBtn.isHidden = true
    }
    
    
    
    func setupUI() {
        imageView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: 150)
        imageView.image = UIImage.init(named: "1")
        self.addSubview(imageView)
        
        textView.frame = CGRect.init(x: 0, y: 150, width: self.bounds.width, height: 50)
        textView.textAlignment = .left
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = UIColor.white
        textView.text = "makiZz"
        textView.showsVerticalScrollIndicator = false
        textView.isScrollEnabled = false
        self.addSubview(textView)
        
        backBtn.frame = CGRect.init(x: 20, y: 20, width: 10, height: 15)
        backBtn.setBackgroundImage(#imageLiteral(resourceName: "Back-icon"), for: .normal)
        backBtn.addTarget(self, action: #selector(backBtnTouch), for: .touchUpInside)
        self.addSubview(backBtn)
    }
    
    func cellSelect() {
        self.superview?.bringSubview(toFront: self)
        backBtn.isHidden = false
        
    }
    
    
    func backBtnTouch() {
        self.backBtnBlcok?()
        backBtn.isHidden = true
    }
    
    
}
