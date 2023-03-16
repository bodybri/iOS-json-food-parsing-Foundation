//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Bryan Huang on 3/6/23.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get the data
        /*let service = DataService()
        self.recipes = service.getLocalData()
        //Set the recipe property
        */
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        // Get a single serving size by multiplying denominator by the recipe servings
        
        // Get target portion by multiplying numerator by target servings
        
        // Reduce fraction by greatest common divisor
        
        // Get the whole portion if numerator > denominator
        
        // Express the remainder as a fraction
        
        return String(targetServings)
    }
}
