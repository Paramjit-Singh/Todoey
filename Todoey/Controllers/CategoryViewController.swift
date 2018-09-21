//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Paramjit Singh on 18/09/2018.
//  Copyright © 2018 Paramjit Singh. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categories = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: - Load category when viewDidLoad
        loadCategories()

    }

    
    //MARK: - TableView Datasource Methods
    
    //TODO: - Specify numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    //TODO: - Create cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
        
        
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    //MARK: - Data Manipulation Methods
    
    //TODO: - Save category method & loadCategory method
    
    func saveCategories(){
        do {
            try context.save()
            print("Saved to context")
        } catch {
            print("Error saving to context \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categories = try context.fetch(request)
            print("Data Loaded!")
        } catch {
            print("Error fetching from context \(error)")
        }
        tableView.reloadData()
    }
    
    @IBAction func addbuttonPressed(_ sender: UIBarButtonItem) {
        
        //TODO: - Create UIAlert
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        //TODO: - Create a UIAlert Action
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
            
            //TODO: - Save the added category
            
            self.saveCategories()
        }
        
        //TODO: - Creating a UITextField
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a new category"
            textField = alertTextField
        }
        
        
        //TODO: - Adding the UIALert Action to the UIAlert
        alert.addAction(action)
        
        //TODO: - Present the UIAlert
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
