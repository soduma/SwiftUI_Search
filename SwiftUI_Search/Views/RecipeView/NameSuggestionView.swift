//
//  NameSuggestionView.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import SwiftUI

struct NameSuggestionView: View {
    var chefRecipesModel = ChefRecipesModel()

    var body: some View {
        ForEach(
          chefRecipesModel.nameSuggestions,
          id: \.self) { suggestion in
            Text(suggestion)
              .searchCompletion(suggestion)
        }
    }
}

struct NameSuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        NameSuggestionView()
    }
}
