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
    var recipeId: Int // Nome deve bater com o usado no código
    
    init(recipeId: Int) {
        self.recipeId = recipeId
    }
}
