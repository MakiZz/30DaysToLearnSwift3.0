//
//  NewsTableViewController.swift
//  project 16 - sildeMenu
//
//  Created by mk on 17/3/20.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController,MenuTransitionManagerDelegate {

    
    let menuTransitionManager = MenuTransitionManager()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return UIStatusBarStyle.lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Everyday Moments"
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.backgroundColor = UIColor.init(red: 0.062, green: 0.062, blue: 0.07, alpha: 1)
    
        
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
 
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        
        cell.backgroundColor = UIColor.clear
        
        if indexPath.row == 0{
            cell.bgImage.image = UIImage.init(named: "1")
            cell.Title.text = "Love mountain"
            cell.author.text = "mk"
            cell.AuthorImage.image = UIImage(named:"a")
        }else if indexPath.row == 1{
            cell.bgImage.image = UIImage(named:"2")
            cell.Title.text = "New graphic design - LIVE FREE"
            cell.author.text = "mk"
            cell.AuthorImage.image = UIImage(named:"b")
            
        }else if indexPath.row == 2{
            cell.bgImage.image = UIImage(named:"3")
            cell.Title.text = "New graphic design - LIVE FREE"
            cell.author.text = "mk"
            cell.AuthorImage.image = UIImage(named:"c")
            
        }else{
            
            cell.bgImage.image = UIImage(named:"4")
            cell.Title.text = "New graphic design - LIVE FREE"
            cell.author.text = "mk"
            cell.AuthorImage.image = UIImage(named:"d")
            
        }
        return cell
        
    }
    
    
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue){
        let sourceController = segue.source as! MenuTableViewController
        self.title = sourceController.currentItem
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuTableViewController = segue.destination as! MenuTableViewController
        menuTableViewController.currentItem = self.title!
        menuTableViewController.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
    }
    
    

}
