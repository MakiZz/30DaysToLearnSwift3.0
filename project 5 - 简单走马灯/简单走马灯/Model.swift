//
//  Model.swift
//  简单走马灯
//
//  Created by mk on 17/3/10.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    var title : String?
    var desc: String?
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage!
    
    init(title: String,desc:String,featuredImage: UIImage) {
        self.title = title
        self.desc = desc
        self.featuredImage = featuredImage
        numberOfMembers = 1
        numberOfPosts = 1
        
    }
    
    static func createModel() -> [Model] {
        
        return [
            Model(title: "Hello there, i miss u.", desc: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hello")!),
            Model(title: "🐳🐳🐳🐳🐳", desc: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "dudu")!),
            Model(title: "Training like this, #bodyline", desc: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "bodyline")!),
            Model(title: "I'm hungry, indeed.", desc: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "wave")!),
            Model(title: "Dark Varder, #emoji", desc: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "darkvarder")!),
            Model(title: "I have no idea, bitch", desc: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hhhhh")!),
        ]
        
    }
    
    
    
    
}
