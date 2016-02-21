//
//  Recipe.swift
//  DeshiRecipe
//
//  Created by Omar Faruqe on 2016-02-20.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import UIKit

class Recipe: NSObject {

    var title:String?
    var content: String?
    
    
    
    init(title:String,content:String){
        self.title = title
        self.content = content
    }
    
    override init(){
        super.init()
    }
}
