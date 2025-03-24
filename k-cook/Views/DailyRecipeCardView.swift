//
//  DailyRecipeCardView.swift
//  k-cook
//
//  Created by User on 24/03/25.
//


import SwiftUI

struct DailyRecipeCardView: View {
    let receita: Receita
    @State private var showingDetail = false

    var body: some View {
        Button(action: {
            showingDetail = true
        }) {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: receita.imagem)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 352, height: 248)
                    } else if phase.error != nil {
                        Color.gray
                            .frame(width: 352, height: 248)
                    } else {
                        ProgressView()
                            .frame(width: 352, height: 248)
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
            .frame(width: 352, height: 248)
            .cornerRadius(15)
            .clipped()
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showingDetail) {
            RecipeDetailSheet(receita: receita)
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(40)
        }
    }
}


#Preview {
    let dataManager = DataManager()

    dataManager.loadData()

    let receitaExemplo = dataManager.receitas[1]

    return DailyRecipeCardView(receita: receitaExemplo)
        .environmentObject(dataManager)

}
