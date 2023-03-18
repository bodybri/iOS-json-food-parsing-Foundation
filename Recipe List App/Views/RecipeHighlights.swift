//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Bryan Huang on 3/17/23.
//

import SwiftUI

struct RecipeHighlights: View {
    var allhighlights = ""
    
    init(highlights:[String]) {
        
        // Loop through the highlights and build the string
        for index in 0..<highlights.count {
            
            // if this is the last item, don't add a coma
            if index == highlights.count - 1 {
                allhighlights += highlights[index]
            }
            else {
                allhighlights += highlights[index] + ", "
            }
            
        }
        
    }
    
    var body: some View {
        Text(allhighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1" , "test2", "Test3"])
    }
}
