//
//  ViewController.swift
//  toDoy
//
//  Created by Ameer Yasin on 2019-08-06.
//  Copyright © 2019 Ameer Yasin. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemArray = ["eat", "sleep", "sex"]

    override func viewDidLoad() {
        super.viewDidLoad()
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
    

}

