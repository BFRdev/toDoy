//
//  ViewController.swift
//  toDoy
//
//  Created by Ameer Yasin on 2019-08-06.
//  Copyright © 2019 Ameer Yasin. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["eat", "sleep", "sex"]
    let defults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = defults.array(forKey: "toDoListArray") as? [String]{
            itemArray = item
        }
    }
    
    //TableView data source methods
    
    //number of rows per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //makes a table cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
            cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // table view delagate methods
    
    //row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        //currect selected row chackmark        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //animates highlight of row 
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //add new items
    @IBAction func addBtnPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            self.itemArray.append(textField.text!)
            self.defults.set(self.itemArray,forKey: "toDoListArray")
            self.tableView.reloadData()
            //once user tappes add 'add item'
            print(textField.text)
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            //extening the scope of alertTextField
            textField = alertTextField
            print("now")
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    

}

