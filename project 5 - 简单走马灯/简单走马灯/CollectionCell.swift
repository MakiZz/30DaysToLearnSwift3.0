//
//  CollectionCell.swift
//  简单走马灯
//
//  Created by mk on 17/3/10.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    var featuredImageView : UIImageView!
    var interestTitleLabel = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUI() {
        featuredImageView = UIImageView.init(frame: .init(x: 0, y: 0, width: 300, height: 350))
        self.contentView.addSubview(featuredImageView)
        
        interestTitleLabel = .init(frame: .init(x: 0, y: 300, width: 300, height: 50))
        interestTitleLabel.backgroundColor = .white
        interestTitleLabel.alpha = 0.5
        interestTitleLabel.textAlignment = .left
        interestTitleLabel.textColor = .black
        interestTitleLabel.font = UIFont.systemFont(ofSize: 10)
        self.contentView.addSubview(interestTitleLabel)
    }
    
    var model: Model? {
        didSet{
            interestTitleLabel.text = model?.title
            featuredImageView.image = model?.featuredImage
        }
    }
    
    
}
