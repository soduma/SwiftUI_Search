//
//  RecipesView.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import SwiftUI

struct RecipesView: View {
    var chefRecipesModel = ChefRecipesModel()
    @State var searchQuery = ""
    @State var filteredRecipes = ChefRecipesModel().recipes
    
    func filterRecipes() {
        if searchQuery.isEmpty {
            filteredRecipes = chefRecipesModel.recipes
        } else {
            filteredRecipes = chefRecipesModel.recipes.filter({ recipe in
                recipe.name.localizedCaseInsensitiveContains(searchQuery)
            })
        }
    }
    
    var body: some View {
        VStack {
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
        .searchable(text: $searchQuery, prompt: "Search by Meal Name")
        .onChange(of: searchQuery, perform: { _ in
            filterRecipes()
        })
        .onSubmit(of: .search) {
            filterRecipes()
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
        Group {
            ContentView()
                .previewDevice("iPhone 12 Pro")
            
            ContentView()
                .previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
