//
//  ViewController.swift
//  project 19 - PullRefresh
//
//  Created by mk on 17/3/22.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    var refreshControl: UIRefreshControl!
    var customView: UIView!
    var labelsArray: Array<UILabel> = []
    var isAnimation = false
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var timer: Timer!
    
    var dataArray = ["😂", "🤗", "😳", "😌", "😊"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
    
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.clear
        refreshControl.tintColor = UIColor.clear
        tableview.addSubview(refreshControl)
        
        loadCustomRefreshContents()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont.init(name: "Apple Color Emoji", size: 40)
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func loadCustomRefreshContents() {
        
        let refreshContents = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)?.last as! UIView
        
//        customView = refreshContents![0] as! UIView
        refreshContents.frame = refreshControl.bounds
        
        for i in 0..<refreshContents.subviews.count {
            labelsArray.append(refreshContents.viewWithTag(i+1) as! UILabel)
            
        }
        refreshControl.addSubview(refreshContents)
        
        
    }
    
    
    
    func animateRefreshStep1() {
        
        isAnimation = true
        
        
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            
            self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI_4))
            self.labelsArray[self.currentLabelIndex].textColor = self.getNextColor()
            
            }) { (finish) in
                UIView.animate(withDuration: 0.05, delay: 0, options: .curveLinear, animations: { 
                    self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform.identity
                    self.labelsArray[self.currentLabelIndex].textColor = UIColor.black
                    
                    
                    }, completion: { (finished) in
                        self.currentLabelIndex += 1
                        if self.currentLabelIndex < self.labelsArray.count {
                            self.animateRefreshStep1()
                        }else{
                            self.animateRefreshStep2()
                        }
                        
                })
        }
        
        
        
    }
    
    func animateRefreshStep2() {
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear, animations: { 
            
            self.labelsArray[0].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[1].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[2].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[3].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[4].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[5].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[6].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[7].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[8].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[9].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[10].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.labelsArray[11].transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            
            }) { (finished) in
            
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveLinear, animations: { 
                
                self.labelsArray[0].transform = CGAffineTransform.identity
                self.labelsArray[1].transform = CGAffineTransform.identity
                self.labelsArray[2].transform = CGAffineTransform.identity
                self.labelsArray[3].transform = CGAffineTransform.identity
                self.labelsArray[4].transform = CGAffineTransform.identity
                self.labelsArray[5].transform = CGAffineTransform.identity
                self.labelsArray[6].transform = CGAffineTransform.identity
                self.labelsArray[7].transform = CGAffineTransform.identity
                self.labelsArray[8].transform = CGAffineTransform.identity
                self.labelsArray[9].transform = CGAffineTransform.identity
                self.labelsArray[10].transform = CGAffineTransform.identity
                self.labelsArray[11].transform = CGAffineTransform.identity
                
                }, completion: { (finished) in
                    
                    if self.refreshControl.isRefreshing{
                        self.currentLabelIndex = 0
                        self.animateRefreshStep1()
                    }else{
                        self.isAnimation = false
                        self.currentLabelIndex = 0
                        for i in 0 ..< self.labelsArray.count {
                            self.labelsArray[i].textColor = UIColor.black
                            self.labelsArray[i].transform = CGAffineTransform.identity
                        }
                    }
                    
            })
        }
        
        
    }
    
    
    
    
    func getNextColor() -> UIColor {
        var colorsArray: Array<UIColor> = [UIColor.magenta,UIColor.brown,UIColor.red,UIColor.green,UIColor.blue,.orange]
        
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        let returnColor = colorsArray[currentColorIndex]
        currentColorIndex += 1
        return returnColor
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        if refreshControl.isRefreshing {
//            if !isAnimation {
//                doSomething()
//                animateRefreshStep1()
//            }
//        }
        guard refreshControl.isRefreshing else{
            return
        }
        guard !isAnimation else{
            return
        }
        doSomething()
        animateRefreshStep1()
    }
    
    
    
    func doSomething() {
        
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(endedOfWork), userInfo: nil, repeats: true)
        
        
    }
    
    
    func endedOfWork() {
        
        refreshControl.endRefreshing()
        timer.invalidate()
        timer = nil
    
    }
    
    
    
}

