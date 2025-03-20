import SwiftUI

struct RecipeDetailView: View {
    let receita: Receita
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: receita.imagem)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Color.gray
                            .frame(height: 200)
                    } else {
                        ProgressView()
                            .frame(height: 200)
                    }
                }
                Text(receita.nome)
                    .font(.headline)
                Text(
                    "\(receita.tempo_preparo) • \(receita.porcoes) • \(receita.dificuldade)"
                )
                .font(.subheadline)

                // Seção de Doramas relacionados
                DoramasSection(doramaIDs: receita.dorama_ids)

                // Seção de Ingredientes
                IngredientsSection(ingredientes: receita.ingredientes)

                // Seção de Preparo
                PreparationSection(passos: receita.preparo)
            }
            .padding()
        }
        .navigationTitle(receita.nome)
    }
}

#Preview {
    let dataManager = DataManager()
    
    dataManager.loadData()
    
    let receitaExemplo = dataManager.receitas[1]
    
    return RecipeDetailView(receita: receitaExemplo)
        .environmentObject(dataManager)
    
}
