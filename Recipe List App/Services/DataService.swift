//
//  DataService.swift
//  Recipe List App
//
//  Created by Bryan Huang on 3/6/23.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get url path to json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the Unique Id
                for r in recipeData {
                    r.id = UUID()
                    
                    // Add uniqe IDs to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                    
                }
                
                // Return the recipes
                return recipeData
                
            }catch {
                // Error parsing Json
                print(error)
            }
                        
        }catch {
            print(error)
        }
        
        return[Recipe]()
    }
    
}
