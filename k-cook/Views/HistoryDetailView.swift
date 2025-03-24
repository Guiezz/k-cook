import SwiftUI

struct HistoryDetailView: View {
    let historia: Historia
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Imagem da história
                    AsyncImage(url: URL(string: historia.imagem)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit() // Evita cortes
                                .frame(maxWidth: .infinity) // Ocupa toda a largura disponível
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

                    // Título
                    Text(historia.titulo)
                        .font(.title)
                        .fontWeight(.bold)

                    // Descrição sem cortes
                    Text(historia.descricao)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true) // Impede corte do texto

                    Spacer(minLength: 20) // Melhora o espaçamento no final
                }
                .padding()
            }
            .navigationTitle("Detalhes")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Fechar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    let dataManager = DataManager()
    dataManager.loadData()

    let historiaExemplo = dataManager.historias[2]

    return HistoryDetailView(historia: historiaExemplo)
        .environmentObject(dataManager)
}
