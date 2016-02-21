//
//  AddRecipeViewController.swift
//  DeshiRecipe
//
//  Created by Omar Faruqe on 2016-02-20.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {

    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeContent: UITextView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var iCloudDocsButton: UIButton!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.enabled = false
        iCloudDocsButton.enabled = false
        doneButton.enabled = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "recipeTitleDidChange", name: UITextFieldTextDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "recipeContentDidChange", name: UITextFieldTextDidChangeNotification, object: nil)

        recipeTitle.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        recipeContent.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func addRecipe(sender: UIButton) {
    }
    
    @IBAction func iCloudDocs(sender: UIButton) {
    }
    
    @IBAction func doneButtonClicked(sender: UIBarButtonItem) {
        recipeContent.resignFirstResponder()
    }
    @IBAction func titleDoneButtonClicked(sender: UITextField) {
        recipeTitle.resignFirstResponder()
    }
    
    func handleDoneButtonState(){
        if(recipeContent.text != ""){
            doneButton.enabled = true
        }
        else{
            doneButton.enabled = false
        }
        
        if(recipeTitle.text != ""){
            addButton.enabled = true
            addButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }
        else{
            addButton.enabled = false
            addButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            
        }
        
    }
    
    func recipeTitleDidChange(){
        handleDoneButtonState()
        
    }
    
    func recipeContentDidChange(){
        handleDoneButtonState()
        
    }
    
}
