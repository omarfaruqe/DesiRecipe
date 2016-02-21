//
//  DeshiRecipeViewController.swift
//  DeshiRecipe
//
//  Created by Omar Faruqe on 2016-02-20.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import UIKit

class DeshiRecipeViewController: UITableViewController {
    
    let recipeName = ["Item", "Item1", "Item2", "Item3"]
    let recipeRegion = ["Bangladeshi","Indian","South Indian", "Chinese", "Thai"]
    
    let recipeDic:[String:[String]] = ["Bangladeshi":["Fish Fry", "Chicken Curry", "Vorta", "Polao"], "Indian":["Iddiuppum", "Idli", "Alu Bokhara"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 70
        //tableView.backgroundView = UIImageView(image: UIImage(named: "Bread"))
        tableView.backgroundColor = UIColor.brownColor() //.colorWithAlphaComponent(0.0)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        print(defaults.objectForKey("myobject")) //as? String
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.alpha = 0.5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 //recipeRegion.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeManager.recipes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell", forIndexPath: indexPath) as! RecipeListTableViewCell
        
        if(indexPath.item % 2 == 0){
            cell.backgroundColor = UIColor.clearColor().colorWithAlphaComponent(0.0)
        }
        else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
        }
        
        switch (indexPath.section) {
        case 0:
            cell.textLabel?.text = recipeName[indexPath.row]
        case 1:
            cell.textLabel?.text = recipeName[indexPath.row]
        case 2:
            cell.textLabel?.text = recipeName[indexPath.row]
        default:
            cell.textLabel?.text = recipeName[indexPath.row]
        }
        
        let recipe = RecipeManager.recipes[indexPath.item]
        cell.textLabel?.text = recipe.title
        cell.recipe = recipe

        return cell
    }
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return recipeRegion[section]
//    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textAlignment = .Center
        headerView.tintColor = UIColor.brownColor().colorWithAlphaComponent(0.0)
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete){
            RecipeManager.deleteRecipe(indexPath.item)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailViewSegue"){
            let cell = sender as! RecipeListTableViewCell
            let detailView = segue.destinationViewController as! DetailsRecipeViewController
            detailView.preRecipe = cell.recipe
        }
        if(segue.identifier == "addViewSegue"){
            let addView = segue.destinationViewController as! AddRecipeViewController
            addView.title = "Add New Recipe"
        }
    }


}
