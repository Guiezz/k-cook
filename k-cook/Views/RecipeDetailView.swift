import SwiftUI

struct RecipeDetailView: View {
    let receitaOriginal: Receita
    @EnvironmentObject var dataManager: DataManager
    @State private var isFavorited: Bool

    init(receita: Receita) {
        self.receitaOriginal = receita
        _isFavorited = State(initialValue: receita.isFavorited)
    }

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: receitaOriginal.imagem)) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFit()
                    } else if phase.error != nil {
                        Color.gray.frame(height: 337)
                    } else {
                        ProgressView().frame(height: 337)
                    }
                }

                VStack(alignment: .leading, spacing: 20) {
                    Text(receitaOriginal.nome)
                        .font(.title3)
                        .fontWeight(.bold)

                    HStack(alignment: .center, spacing: 20) {
                        InfoBox(icon: "stopwatch", title: "Tempo de Preparo:", value: receitaOriginal.tempo_preparo)
                        InfoBox(icon: "chart.bar", title: "Dificuldade:", value: receitaOriginal.dificuldade)
                        InfoBox(icon: "fork.knife", title: "Porções:", value: receitaOriginal.porcoes)
                        InfoBox(icon: "cup.and.saucer", title: "Refeição:", value: receitaOriginal.refeicao)
                    }

                    DoramasSection(doramaIDs: receitaOriginal.dorama_ids)
                    IngredientsSection(ingredientes: receitaOriginal.ingredientes)
                    PreparationSection(passos: receitaOriginal.preparo)
                }
                .padding()
            }
        }
        .navigationTitle(receitaOriginal.nome)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 16) {
                    Button {
                        dataManager.toggleFavorito(receitaId: receitaOriginal.id)
                        isFavorited.toggle()
                    } label: {
                        Image(systemName: isFavorited ? "heart.fill" : "heart")
                            .font(.system(size: 20))
                            .foregroundColor(.red)
                    }

                    ShareLink(item: receitaOriginal.nome) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 20))
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

// Componente auxiliar para exibir as informações da receita
struct InfoBox: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: icon)
                .foregroundColor(.red)
            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
            Text(value)
                .font(.footnote)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    NavigationStack {
        RecipeDetailView(receita: DataManager().receitas[1])
            .environmentObject(DataManager())
    }
}
