//
//  IngredientSuggestionView.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import SwiftUI

struct IngredientSuggestionView: View {
    var chefRecipesModel = ChefRecipesModel()
    
    var body: some View {
        ForEach(chefRecipesModel.ingredientSuggestions, id: \.self) { ingredient in
            Text(ingredient)
                .searchCompletion(ingredient)
                .padding()
                .font(.title)
        }
    }
}

struct IngredientSuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientSuggestionView()
    }
}
