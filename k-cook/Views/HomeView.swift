import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedReceita: Receita?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("K-COOK")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .fontDesign(.monospaced)
                    Spacer()
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 10) {
                    Text("O que vamos preparar?")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("Hora de cozinhar!")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {

                    HStack(spacing: 10) {
                        ForEach(
                            ["Café da manhã", "Almoço", "Jantar", "Sobremesa"],
                            id: \.self
                        ) { refeicao in
                            Button(action: {
                                // Adicionar ações de filtro dps
                            }) {
                                VStack {
                                    Text(refeicao)
                                        .font(.caption)
                                }

                                .padding()
                                .background(Color(.systemBackground))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.blue, lineWidth: 5)
                                )

                            }
                        }
                    }
                    .padding()
                }
                .padding()

                VStack(alignment: .leading) {
                    Text("Receitas")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(dataManager.receitas) { receita in
                                RecipeCardView(receita: receita)
                                    .frame(width: 147)
                                    .onTapGesture {
                                        selectedReceita = receita
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
        }
        .sheet(item: $selectedReceita) { receita in
            RecipeDetailSheet(receita: receita)
        }
    }

    private func refeicaoIcon(for refeicao: String) -> String {
        switch refeicao {
        case "Café da manhã": return "cup.and.saucer.fill"
        case "Almoço": return "fork.knife"
        case "Jantar": return "sunset.fill"
        case "Sobremesa": return "apple.logo"
        default: return "questionmark"
        }
    }
}

#Preview {
    let dataManager = DataManager()
    dataManager.loadData()

    return HomeView()
        .environmentObject(dataManager)
}
