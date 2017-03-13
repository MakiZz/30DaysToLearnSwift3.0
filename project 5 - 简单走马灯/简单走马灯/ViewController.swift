//
//  ViewController.swift
//  简单走马灯
//
//  Created by mk on 17/3/10.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    let WIDTH = UIScreen.main.bounds.size.width
    let HEIGHT = UIScreen.main.bounds.size.height
    var collection : UICollectionView?
    // 文件内私有
    fileprivate var data = Model.createModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let bgImageView = UIImageView.init(frame: .init(x: 0, y: 0, width: WIDTH, height: HEIGHT))
        bgImageView.image = #imageLiteral(resourceName: "blue")
        view.addSubview(bgImageView)
    
        showBlurEffect()
        creatCollectionView()
    }
    
    func showBlurEffect() {
        let blurEffect = UIBlurEffect.init(style: .light)
        
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        blurView.frame = CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT)
        view.addSubview(blurView)
        
        let vibrancyEffet = UIVibrancyEffect.init(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView.init(effect: vibrancyEffet)
        vibrancyView.frame = .init(x: 0, y: 0, width: WIDTH, height: HEIGHT)
        
        let signLabel = UILabel.init(frame: .init(x: 0, y: 50, width: WIDTH, height: 100))
        signLabel.text = "梦里不觉秋已深  余情岂是为他人"
        signLabel.numberOfLines = 0
        signLabel.font = UIFont.init(name: "GeezaPro-Bold", size: 20)
        signLabel.textAlignment = .center
        signLabel.textColor = .white
        vibrancyView.contentView.addSubview(signLabel)
        
        blurView.contentView.addSubview(vibrancyView)
        self.view.addSubview(blurView)
    
    
    }
    
    func creatCollectionView() {
        
        let layout = UICollectionViewFlowLayout.init()
        collection = UICollectionView.init(frame: .init(x: 0, y: 150, width: WIDTH, height: 350), collectionViewLayout: layout)
        layout.itemSize = .init(width: 300, height: 350)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 20
        collection?.showsVerticalScrollIndicator = false
        collection?.showsHorizontalScrollIndicator = true
        collection?.delegate = self
        collection?.dataSource = self
        collection?.register(CollectionCell.self, forCellWithReuseIdentifier: "Cell")
        layout.scrollDirection = .horizontal
        collection?.backgroundColor = .clear
        
        self.view.addSubview(collection!)
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection?.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCell
        
        cell.model = data[indexPath.row]
        return cell
    }
    
    
}

