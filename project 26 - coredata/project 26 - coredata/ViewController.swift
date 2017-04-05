//
//  ViewController.swift
//  project 26 - coredata
//
//  Created by mk on 17/4/5.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UITableViewController {

    
    var listItems = [NSManagedObject]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
    }

    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListEntity")
        
        
        do {
          let results = try managerContext.fetch(fetchRequest)
            listItems = results as! [NSManagedObject]
            self.tableView.reloadData()
        } catch  {
            print("error")
        }
        
    }
    
    
    func addItem() {
        let alertController = UIAlertController.init(title: "New Resolution", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let confirmAction = UIAlertAction.init(title: "Confirm", style:.default) { (_) in
            if let field = alertController.textFields![0] as? UITextField{
                
                self.saveItem(itemToSave: field.text!)
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        alertController.addTextField { (textField) in
            textField.placeholder = "Type somting..."
            
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
         self.present(alertController, animated: true, completion: nil)
    }
    
    func saveItem(itemToSave: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext = appDelegate.persistentContainer.viewContext
        
        
        let entity = NSEntityDescription.entity(forEntityName: "ListEntity", in: managerContext)
        let item = NSManagedObject.init(entity: entity!, insertInto: managerContext)
        
        item.setValue(itemToSave, forKey: "item")
        
        do {
            try managerContext.save()
            listItems.append(item)
        } catch  {
            print("error")
        }
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        
        let item = listItems[indexPath.row]
        cell.textLabel?.text = item.value(forKey: "item") as! String
        cell.textLabel?.font = UIFont.init(name: "", size: 25)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction.init(style: .normal, title: "Delete") { (action, index) in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            
            tableView.reloadRows(at: [indexPath], with: .right)
            managedContext.delete(self.listItems[indexPath.row])
        
            do{
                try managedContext.save()
                self.listItems.remove(at: indexPath.row)
                self.tableView.reloadData()
                
            }catch{
                print("error:delete")
            }
            
        }
        delete.backgroundColor = UIColor.red
        return [delete]
        
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
}

