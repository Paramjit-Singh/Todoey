//
//  ViewController.swift
//  Todoey
//
//  Created by Paramjit Singh on 16/09/2018.
//  Copyright © 2018 Paramjit Singh. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike","Buy Eggos","Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK = TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
        
        
        // Checking to see if the cell has a accessoryType of checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            // if there is not an accessoryType of checkmark
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // animate the selection to not stay highlighted
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}

