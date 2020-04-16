//
//  UserDefaultsManager.swift
//  Recipe
//
//  Created by Lara Tenore on 12/04/20.
//  Copyright © 2020 Lara Tenore Ferreira. All rights reserved.
//

import UIKit

class UserDefaultsManager: NSObject {

    static let userDefaults = UserDefaults.standard
    
    class func synchronize() {
        
        let myData = NSKeyedArchiver.archivedData(withRootObject: RecipeManager.recipes)
        
        UserDefaults.standard.set(myData, forKey: "recipearray")
        
        UserDefaults.standard.synchronize()
        
    }
    
    class func initializeDefaults() {
        if let recipesRaw = UserDefaults.standard.data(forKey: "recipearray") {
            if let recipes = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(recipesRaw) as? [Recipe] {
                RecipeManager.recipes = recipes
            }
        }
    }
    
}
