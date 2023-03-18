//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Bryan Huang on 3/9/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
        
    var body: some View {
        
        let featuredRecipe = model.recipes.filter({ $0.featured })
        
        /*let tempRecipes = model.recipes.filter { r in
         // Condition in which to include a recipe in this array
         if r.featured == true {
         return
         }
         }*/
        
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
            
            GeometryReader { geo in
                
                TabView {
                    
                    // loop through each recipe
                    ForEach(0..<featuredRecipe.count) { index in
                        //ForEach (0..<model.recipes.count) { index in
                        
                        
                        // MARK: Recipe card button
                        Button(action: {
                            // show recipe detail sheet
                            self.isDetailViewShowing = true
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 0) {
                                    Image(featuredRecipe[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(featuredRecipe[index].name)
                                        .padding(5)
                                        .font(Font.custom("Avenir", size: 16))
                                }
                            }
                        })
                        .tag(index)
                        // Recipe card display
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(color: Color(.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.4)), radius: 10, x:-5, y: 5)
                        
                        
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .shadow(color: .gray, radius: 10)
            }
            
            VStack (alignment: .leading, spacing: 5) {
                Text("Preparation Time:")
                    .bold()
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .bold()
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .font(Font.custom("Avenir", size: 16))
            .padding([.leading, .bottom])
        }
        .sheet(isPresented: $isDetailViewShowing) {
            // Display the Recipe Detail View
            RecipeDetailView(recipe: featuredRecipe[tabSelectionIndex])
            
        }
        
        /*.onAppear(perform: {
         setFeaturedIndex()
         })
         }
         
         func setFeaturedIndex() {
         
         // Find the index of first recipe that is featured
         var index = model.recipes.firstIndex { (recipe) -> Bool in
         return recipe.featured
         }
         tabSelectionIndex = index ?? 0
         
         }*/
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
