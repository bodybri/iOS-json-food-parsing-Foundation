//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Bryan Huang on 3/6/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                Divider()
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredeints")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text("~ " + item)
                    }
                    
                }
                .padding(.horizontal , 10)
                Divider()

                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                        
                    }
                }
                .padding(.horizontal , 10)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
