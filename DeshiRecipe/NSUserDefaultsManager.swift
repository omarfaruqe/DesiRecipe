//
//  NSUserDefaultsManager.swift
//  DeshiRecipe
//
//  Created by Omar Faruqe on 2016-02-21.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import UIKit

class NSUserDefaultsManager: NSObject {
    
    static let userDefaults = NSUserDefaults.standardUserDefaults()
    
    class func synchronize(){
        let myData = NSKeyedArchiver.archivedDataWithRootObject(RecipeManager.recipes)
        NSUserDefaults.standardUserDefaults().setObject(myData, forKey: "recipeArray")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func initializeDefault(){
        if let recipiesRaw = NSUserDefaults.standardUserDefaults().dataForKey("recipeArray") {
            if let recipies = NSKeyedUnarchiver.unarchiveObjectWithData(recipiesRaw) as? [Recipe] {
                RecipeManager.recipes = recipies
            }
        }
    }
}
