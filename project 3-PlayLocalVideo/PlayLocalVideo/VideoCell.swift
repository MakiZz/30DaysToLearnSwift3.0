//
//  VideoCell.swift
//  PlayLocalVideo
//
//  Created by mk on 17/3/9.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}


class VideoCell: UITableViewCell {

    @IBOutlet weak var VideoScreenShot: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
