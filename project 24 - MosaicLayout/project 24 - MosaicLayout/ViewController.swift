//
//  ViewController.swift
//  project 24 - MosaicLayout
//
//  Created by mk on 17/3/31.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,FMMosaicLayoutDelegate {

    var mosaicLayout = FMMosaicLayout()
    var imageArray = [String]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"]
     
        self.collectionView?.collectionViewLayout = mosaicLayout
     
    }

    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, numberOfColumnsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let randomBlue = CGFloat(drand48())
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        
        cell.backgroundColor = UIColor.init(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        cell.alpha = 0
        
        let imageview = cell.viewWithTag(2) as! UIImageView
        imageview.image = UIImage.init(named: imageArray[indexPath.row])
        
        let cellDelay = UInt64.init((arc4random() % 600) / 1000)
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(Int(cellDelay))) {
            UIView.animate(withDuration: 0.8, animations: { 
                cell.alpha = 1
            })
        }

        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 1, left: 1, bottom: 1, right: 1)
    }
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, interitemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, mosaicCellSizeForItemAt indexPath: IndexPath!) -> FMMosaicCellSize {
        return indexPath.item % 7 == 0 ? FMMosaicCellSize.big : FMMosaicCellSize.small
    }
    


}

