//
//  NewsTableViewCell.swift
//  project 16 - sildeMenu
//
//  Created by mk on 17/3/20.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var AuthorImage: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var author: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    
//        AuthorImage.layer.cornerRadius = AuthorImage.frame.width / 2
//        AuthorImage.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
