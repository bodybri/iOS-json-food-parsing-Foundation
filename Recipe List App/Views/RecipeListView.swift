//
//  ContentView.swift
//  Recipe List App
//
//  Created by Bryan Huang on 3/6/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    // Reference the view model
    //@ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75, alignment:.center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                })
                
                
                
            }
            .navigationBarTitle("All Recipe")
        }
        
    }
    
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}
