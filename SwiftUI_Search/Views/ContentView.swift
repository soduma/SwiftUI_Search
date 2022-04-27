//
//  ContentView.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import SwiftUI

struct ContentView: View {
  var chefRecipesModel = ChefRecipesModel()

  var body: some View {
    NavigationView {
      RecipesView()
      RecipeDetailView(recipe: chefRecipesModel.recipes[0])
    }
    .accentColor(Color("rw-green"))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .previewDevice("iPhone 12 Pro")

      ContentView()
        .previewDevice("iPad Pro (9.7-inch)")
    }
  }
}
