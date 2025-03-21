//
//  RecipeCardSection.swift
//  k-cook
//
//  Created by User on 20/03/25.
//

import SwiftUI

struct RecipeCardView: View {
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
                            .frame(width: 150, height: 187)
                    } else if phase.error != nil {
                        Color.gray
                            .frame(width: 144, height: 187)
                    } else {
                        ProgressView()
                            .frame(width: 144, height: 187)
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
            .frame(width: 150, height: 187)
            .cornerRadius(8)
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

struct RecipeDetailSheet: View {
    let receita: Receita
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            RecipeDetailView(receita: receita)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
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
