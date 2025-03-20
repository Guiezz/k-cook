//
//  RecipeCardSection.swift
//  k-cook
//
//  Created by User on 20/03/25.
//

import SwiftUI

struct RecipeCardView: View {
    let receita: Receita

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: receita.imagem)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 250, height: 150)
            .scaledToFit()
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(receita.nome)
                    .font(.headline)
                Text(
                    "\(receita.tempo_preparo) • \(receita.porcoes) • \(receita.dificuldade)"
                )
                .font(.subheadline)
            }
        }
    }
}

#Preview {
    let dataManager = DataManager()
    
    dataManager.loadData()
    
    let receitaExemplo = dataManager.receitas[1]
    
    return RecipeCardView(receita: receitaExemplo)
        .environmentObject(dataManager)

}
