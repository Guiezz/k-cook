import SwiftUI

struct HistoryDetailView: View {
    let historia: Historias
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss
    @State private var selectedReceita: Receita?

    private var receitasRelacionadas: [Receita] {
        dataManager.receitas.filter {
            historia.receitas_relacionadas.contains($0.id)
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: historia.imagem)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .cornerRadius(12)
                        case .failure:
                            Color.gray
                                .frame(height: 300)
                                .cornerRadius(12)
                        default:
                            ProgressView()
                                .frame(height: 300)
                        }
                    }

                    Text(historia.titulo)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(historia.descricao)
                        .font(.body)
                        .foregroundStyle(.secondary)
                    if !receitasRelacionadas.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(receitasRelacionadas) { receita in
                                        RecipeCardView(receita: receita)
                                            .onTapGesture {
                                                selectedReceita = receita
                                            }
                                    }
                                }
                                .padding(.horizontal, 5)
                            }
                        }
                    }

                    Spacer(minLength: 20)
                }
                .padding()
            }
        }
    }
}

#Preview {
    let dataManager = DataManager()
    dataManager.loadData()
    let historiaExemplo = dataManager.historias[1]
    return HistoryDetailView(historia: historiaExemplo)
        .environmentObject(dataManager)
}
