//
//  RecipeManager.swift
//  DeshiRecipe
//
//  Created by Omar Faruqe on 2016-02-20.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import UIKit

class RecipeManager: NSObject {
    static var recipes = [Recipe]()
    
    class func addRecipe(title:String,content:String){
        let r = Recipe(title: title, content: content)
        recipes.append(r)
    }
    
    class func deleteRecipe(id: Int){
        recipes.removeAtIndex(id)
    }
    
    class func getRecipe(id: Int) -> Recipe {
        if(recipes.count > 0) {
            return recipes[id]
        }
        return Recipe()
    }
}
