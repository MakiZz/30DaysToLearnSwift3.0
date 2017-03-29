//
//  AnimationImageData.swift
//  project 20 - Collection转场动画
//
//  Created by mk on 17/3/29.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

struct AnimationImageData {
   
    fileprivate let imageName = ["1","2","3","4","5"]
    var images = [AnimationCellModel]()
    init() {
        images = imageName.map({
            AnimationCellModel.init(imageName: $0)
        })
    }
    
}
