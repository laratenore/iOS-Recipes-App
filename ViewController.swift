//
//  ViewController.swift
//  Recipe
//
//  Created by Lara Tenore on 05/04/20.
//  Copyright © 2020 Lara Tenore Ferreira. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeManager.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell") as! customcell
        
        let rcp = RecipeManager.recipes[indexPath.item]
        cell.textLabel?.text = rcp.title
        cell.recipe = rcp
      
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailView" {
            let cell = sender as! customcell
            let detailView = segue.destination as! DetailViewController

            detailView.preRecipe = cell.recipe
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.rowHeight = 70
        //tableView.backgroundView = UIImageView(image: "nome da imagem")
        
        UserDefaultsManager.initializeDefaults()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.alpha = 0.2
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteRecipe = UIContextualAction(style: .normal, title: "Delete") { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in
            RecipeManager.DeleteRecipe(id: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
            tableView.reloadData()
            
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteRecipe])
    }


}

