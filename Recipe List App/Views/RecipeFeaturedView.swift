//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Bryan Huang on 3/9/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                
                TabView {
                    
                    // loop through each recipe
                    ForEach(Array(model.recipes.enumerated()), id: \.element.id) { index, recipe in
                    //ForEach (0..<model.recipes.count) { index in
                        
                        // Only show those that should be featured
                        if model.recipes[index].featured == true {
                            
                            // Recipe card display
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }.frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.4)), radius: 10, x:-5, y: 5)
                            
                            
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .shadow(color: .gray, radius: 10)
            }
            
            VStack (alignment: .leading, spacing: 5) {
                Text("Preparation Time:")
                    .bold()
                Text("1 Hour")
                Text("Highlights")
                    .bold()
                Text("Healty, Hearty")
            }
            .padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
