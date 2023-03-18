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
            
            VStack(alignment: .leading) {
                
            Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 24))
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
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
                                        VStack (alignment: .leading) {
                                            
                                            Text(r.name)
                                                .foregroundColor(.black)
                                                .bold()
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.black)
                                                .font(Font.custom("Avenir", size: 16))

                                        }
                                    }
                                })
                            
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
            .padding(.bottom)
        }
        
    }
    
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}
