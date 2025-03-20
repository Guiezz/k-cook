//
//  IngredientsSection.swift
//  k-cook
//
//  Created by User on 20/03/25.
//

import SwiftUI

struct IngredientsSection: View {
    let ingredientes: [Ingrediente]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ingredientes")
                .font(.headline)

            ForEach(ingredientes) { ingrediente in
                Text("• \(ingrediente.nome)")
                    .font(.subheadline)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    let dataManager = DataManager()

    dataManager.loadData()

    let ingredientesExemplo = dataManager.receitas.first?.ingredientes ?? []

    return IngredientsSection(ingredientes: ingredientesExemplo)
        .environmentObject(dataManager)
}

