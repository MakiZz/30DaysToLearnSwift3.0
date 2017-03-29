//
//  PatternCell.swift
//  project 21 - cell滑动编辑
//
//  Created by mk on 17/3/29.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

struct pattern {
    let image: String
    let name: String
}


class PatternCell: UITableViewCell {

    
    @IBOutlet weak var patternImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
