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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 70
        //tableView.backgroundView = UIImageView(image: UIImage(named: "Bread"))
        tableView.backgroundColor = UIColor.brownColor() //.colorWithAlphaComponent(0.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return recipeRegion.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipeName.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell", forIndexPath: indexPath)
        
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

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return recipeRegion[section]
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textAlignment = .Center
        headerView.tintColor = UIColor.brownColor().colorWithAlphaComponent(0.0)
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
