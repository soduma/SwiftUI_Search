//
//  RecipeImage.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import SwiftUI

struct RecipeImage: View {
    var imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(5)
        } placeholder: {
            ZStack {
                Image("rw-logo")
                    .resizable()
                    .scaledToFit()
                ProgressView()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct RecipeImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeImage(imageURL: ChefRecipesModel().recipes[0].imageURL)
                .previewDevice("iPhone 12 Pro")
            
            RecipeImage(imageURL: ChefRecipesModel().recipes[0].imageURL)
                .previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
