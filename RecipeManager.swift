//
//  RecipeManager.swift
//  Recipe
//
//  Created by Lara Tenore on 12/04/20.
//  Copyright © 2020 Lara Tenore Ferreira. All rights reserved.
//

import UIKit

class RecipeManager: NSObject {
    
    static var recipes = [Recipe]()
    
    class func AddRecipe(title: String, content: String){
        let rcp = Recipe(title: title, content: content)
        recipes.append(rcp)
    }
    
    class func DeleteRecipe(id: Int){
        recipes.remove(at: id)
    }
    
    class func GetRecipe(id: Int) -> Recipe{
        if recipes.count > 0 {
            return recipes[id]
        }
        
        return Recipe()
        
    }

}
