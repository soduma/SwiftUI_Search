//
//  RecipeDetailView.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import SwiftUI

struct RecipeDetailView: View {
  var recipe: Recipe

  var body: some View {
    VStack(alignment: .center) {
      RecipeImage(imageURL: recipe.imageURL)
        .padding([.leading, .trailing])

      Text("Ingredients")
        .foregroundColor(Color("rw-dark"))
        .font(.largeTitle)

      List {
        ForEach(recipe.ingredients, id: \.self) { ingredient in
          IngredientView(ingredient: ingredient)
        }
        .listStyle(.inset)
      }
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Text(recipe.name)
          .foregroundColor(Color("rw-dark"))
          .fontWeight(.bold)
      }
    }
  }
}

struct RecipeView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      RecipeDetailView(recipe: ChefRecipesModel().recipes[0])
        .previewDevice("iPhone 12 Pro")

      RecipeDetailView(recipe: ChefRecipesModel().recipes[0])
        .previewDevice("iPad Pro (9.7-inch)")
    }
  }
}
