//
//  ViewController.swift
//  CustomFont
//
//  Created by mk on 17/3/9.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    var fontNames = ["PingFangSC-Light", "GeezaPro-Bold", "Avenir-Medium", "Palatino-Bold", "LaoSangamMN"]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var fontTableView: UITableView!
    @IBOutlet weak var changeFontButton: UIButton!
    
    @IBAction func changeFont(_ sender: AnyObject) {
        
        fontRowIndex = (fontRowIndex + 1) % 5
        fontTableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontTableView.dataSource = self
        fontTableView.delegate = self
        
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                print(font)
            }
        }

        changeFontButton.layer.cornerRadius = 55
    }


    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        
        let text = data[indexPath.row]
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
        print(fontNames[fontRowIndex])
        cell.textLabel?.font = UIFont(name:fontNames[fontRowIndex],size:16)
        
        
        return cell
    }
    
  
  
    
    
}

