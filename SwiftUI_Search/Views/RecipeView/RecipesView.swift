//
//  RecipesView.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import SwiftUI

struct RecipesView: View {
    @Environment(\.isSearching) var isSearching
    @Binding var searchQuery: String
    @Binding var isSearchingIngredient: Bool
    
    var chefRecipesModel = ChefRecipesModel()
    var filteredRecipes: [Recipe] {
        if searchQuery.isEmpty {
            return chefRecipesModel.recipes
        } else {
            if isSearchingIngredient {
                let filteredRecipes = chefRecipesModel.recipes.filter {
                    !$0.ingredients.filter { ingredient in
                        ingredient.emoji == searchQuery
                    }.isEmpty
                }
                return filteredRecipes
            } else {
                return chefRecipesModel.recipes.filter {
                    $0.name.localizedCaseInsensitiveContains(searchQuery)
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Toggle("**Search By Ingredients**", isOn: $isSearchingIngredient)
                .tint(Color("rw-green"))
                .foregroundColor(Color("rw-green"))
                .font(.body)
                .padding([.leading, .trailing])
            
            if isSearching {
                Text("Search Results: \(filteredRecipes.count) of \(chefRecipesModel.recipes.count)")
                    .foregroundColor(Color("rw-green"))
                    .opacity(0.5)
            }
            
            List {
                ForEach(filteredRecipes, id: \.self) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        Text(recipe.name)
                            .foregroundColor(Color("rw-dark"))
                    }
                }
            }
            .listStyle(.inset)
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Recipes")
                    .foregroundColor(Color("rw-dark"))
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var recipes = ChefRecipesModel().recipes
    
    static var previews: some View {
        RecipesView(searchQuery: .constant(""),
                    isSearchingIngredient: .constant(false))
        .previewDevice("iPhone SE (3rd generation)")
        
        RecipesView(searchQuery: .constant(""),
                    isSearchingIngredient: .constant(false))
        .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
