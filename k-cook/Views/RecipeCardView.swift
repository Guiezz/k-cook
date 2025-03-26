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
        NavigationLink(destination: RecipeDetailView(receita: receita)) {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: receita.imagem)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 260, height: 127)
                    } else if phase.error != nil {
                        ProgressView()
                            .frame(width: 260, height: 127)
                    } else {
                        Color.gray
                            .frame(width: 260, height: 127)
                    }
                }
                .clipped()
                
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                
                VStack(alignment: .leading) {
                    Text(receita.nome)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("\(receita.tempo_preparo) | \(receita.dificuldade)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding(10)
            }
            .frame(width: 260, height: 127)
            .cornerRadius(15)
            .clipped()
        }
    }
}


#Preview {
    let dataManager = DataManager()

    let receitaExemplo = dataManager.receitas[1]

    RecipeCardView(receita: receitaExemplo)
        .environmentObject(dataManager)

}
