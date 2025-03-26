//
//  ReceitasFavoritas.swift
//  k-cook
//
//  Created by User on 26/03/25.
//
// ReceitaFavorita.swift
import SwiftData

@Model
class ReceitaFavorita {
    var recipeId: Int
    
    init(recipeId: Int) {
        self.recipeId = recipeId
    }
}
