//
//  ViewController.swift
//  project  25 - 基础动画
//
//  Created by mk on 17/4/1.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tableView : UITableView!
    let textArray = ["Position","Opacity","Scale","Color","Rotation"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        self.view.addSubview(tableView)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = textArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(OpacityViewController(), animated: true)
        }else if indexPath.row == 4{
            self.navigationController?.pushViewController(RotationViewController(), animated: true)
        }
    }
    
    

}

