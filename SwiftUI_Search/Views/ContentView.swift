//
//  ContentView.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import SwiftUI

struct ContentView: View {
    var chefRecipesModel = ChefRecipesModel()
    @State var searchQuery = ""
    @State var isSearchingIngredient = false

    var body: some View {
        NavigationView {
            RecipesView(searchQuery: $searchQuery, isSearchingIngredient: $isSearchingIngredient)
            RecipeDetailView(recipe: chefRecipesModel.recipes[0])
        }
        .accentColor(Color("rw-green"))
        .searchable(text: $searchQuery, prompt: isSearchingIngredient ? "Search By Ingredient": "Search by Meal Name", suggestions: {
            ForEach(chefRecipesModel.nameSuggestions, id: \.self) { suggestion in
                if searchQuery.isEmpty {
                    if isSearchingIngredient {
                        IngredientSuggestionView()
                    } else {
                        NameSuggestionView()
                    }
                }
            }
        })
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
