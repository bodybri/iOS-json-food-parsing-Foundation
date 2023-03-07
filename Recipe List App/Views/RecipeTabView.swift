//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Bryan Huang on 3/7/23.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {

        TabView {
            Text("Featured View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Stared")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                    
            
            }
        }

    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
