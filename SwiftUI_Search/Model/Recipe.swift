//
//  Recipe.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import Foundation

struct Recipe: Hashable, Codable {
  var name: String
  var ingredients: [Ingredient]
  var steps: [String]
  var timers: [Int]
  var imageURL: String
}
