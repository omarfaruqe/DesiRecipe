//
//  Recipe.swift
//  DeshiRecipe
//
//  Created by Omar Faruqe on 2016-02-20.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import UIKit

class Recipe: NSObject, NSCoding {

    var title:String?
    var content: String?
    
    init(title:String,content:String){
        self.title = title
        self.content = content
    }
    
    override init(){
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let titleDecoded = aDecoder.decodeObjectForKey("title") as? String{
            title = titleDecoded
        }
        if let contentDecoded = aDecoder.decodeObjectForKey("content") as? String{
            content = contentDecoded
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let titleEncoded = title {
            aCoder.encodeObject(titleEncoded, forKey: "title")
        }
        if let contentEncoded = content {
            aCoder.encodeObject(contentEncoded, forKey: "content")
        }
    }
}
