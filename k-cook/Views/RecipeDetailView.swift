import SwiftUI

struct RecipeDetailView: View {
    let receita: Receita
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: receita.imagem)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Color.gray
                            .frame(height: 337)
                    } else {
                        ProgressView()
                            .frame(height: 337)
                    }
                }
                VStack(alignment: .leading, spacing: 20) {
                    Text(receita.nome)
                        .font(.title3)
                        .fontWeight(.bold)
                    HStack(alignment: .center, spacing: 20) {
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "stopwatch")
                                .foregroundColor(.red)
                            Text("Tempo de Preparo:")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                            Text(receita.tempoPreparo)
                                .font(.footnote)
                                .fontWeight(.bold)
                        }
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "chart.bar")
                                .foregroundColor(.red)
                            Text("Dificuldade:")
                                .font(.caption)
                            Text(receita.dificuldade)
                                .font(.footnote)
                                .fontWeight(.bold)
                        }

                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "fork.knife")
                                .foregroundColor(.red)
                            Text("Porções:")
                                .font(.caption)
                            Text(receita.porcoes)
                                .font(.footnote)
                                .fontWeight(.bold)
                        }
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "cup.and.saucer")
                                .foregroundColor(.red)
                            Text("Refeição:")
                                .font(.caption)
                            Text(receita.refeicao)
                                .font(.footnote)
                                .fontWeight(.bold)
                        }
                    }
                    .cornerRadius(8)

                    DoramasSection(doramaIDs: receita.doramaIds)

                    IngredientsSection(ingredientes: receita.ingredientes)

                    PreparationSection(passos: receita.preparo)
                }
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
