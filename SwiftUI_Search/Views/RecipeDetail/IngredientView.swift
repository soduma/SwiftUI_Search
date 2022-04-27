//
//  IngredientView.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import SwiftUI

struct IngredientView: View {
  var ingredient: Ingredient

  var body: some View {
    HStack {
      Text(ingredient.name)
        .fontWeight(.bold)
      Spacer()
      Text(ingredient.quantity)
        .foregroundColor(Color("rw-green"))
    }
  }
}

struct IngredientView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      IngredientView(ingredient: ChefRecipesModel().recipes[0].ingredients[0])
        .previewDevice("iPhone 12 Pro")

      IngredientView(ingredient: ChefRecipesModel().recipes[0].ingredients[0])
        .previewDevice("iPad Pro (9.7-inch)")
    }
  }
}
