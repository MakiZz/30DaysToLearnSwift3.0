//
//  ViewController.swift
//  project 20 - Collection转场动画
//
//  Created by mk on 17/3/28.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var collectionView : UICollectionView?
    
    let layout = UICollectionViewFlowLayout()
    
    var imageData = AnimationImageData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCollection()
    }
    
    func createCollection() {
        
        layout.itemSize = CGSize.init(width: UIScreen.main.bounds.size.width - 40, height: 200)
        layout.minimumLineSpacing = 20
        layout.headerReferenceSize = CGSize.init(width: UIScreen.main.bounds.size.width, height: 20)
        collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.backgroundColor = .yellow
        collectionView?.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.view.addSubview(collectionView!)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CustomCollectionViewCell
        item?.backBtnBlcok = {
            collectionView.isScrollEnabled = true
            collectionView.reloadItems(at: [indexPath])
        }
        item?.setcellContentView(model: imageData.images[indexPath.row])
        return item!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else {
            return
        }
        cell.cellSelect()
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: { 
            cell.frame = collectionView.bounds
            }) { (finish) in
                collectionView.isScrollEnabled = false
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.images.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    
    
    
    
    
    
    
}

