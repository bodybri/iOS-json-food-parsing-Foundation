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
    
}
