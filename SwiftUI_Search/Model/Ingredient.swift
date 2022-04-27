//
//  Ingredient.swift
//  SwiftUI_Search
//
//  Created by 장기화 on 2022/04/27.
//

import Foundation

struct Ingredient: Hashable, Codable {
    var quantity: String
    var name: String
    var type: String
    var emoji: String
}
