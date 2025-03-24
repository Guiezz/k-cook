import SwiftUI

struct HistoryCardView: View {
    let historia: Historias // Corrigido para "Historias"
    @State private var showingDetail = false

    var body: some View {
        Button(action: {
            showingDetail = true
        }) {
            ZStack(alignment: .bottomLeading) {
                // Use uma imagem padrão ou remova o AsyncImage se não houver URL de imagem
                Color.gray
                    .frame(width: 319, height: 353)
                
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                
                VStack(alignment: .leading) {
                    Text(historia.titulo)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(10)
            }
            .frame(width: 319, height: 353)
            .cornerRadius(14)
            .clipped()
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showingDetail) {
            // Substitua pelo detalhe da história, se necessário
            Text("Detalhe da História")
        }
    }
}

struct HistoryCardSheet: View {
    let historia: Historias
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            // Substitua pelo detalhe da história, se necessário
            Text("Detalhe da História: \(historia.titulo)")
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
    // Exemplo estático para o preview
    let historiaExemplo = Historias(
        id: 1,
        titulo: "Ocupação Japonesa (1910–1945): A Resistência na Panela",
        descricao: "Durante a ocupação japonesa...",
        pratos_relacionados: [
            PratoRelacionado(
                nome: "Kimbap",
                motivo: "Adaptação do sushi japonês...",
                detalhes_adicionais: "Usava óleo de gergelim..."
            )
        ],
        receitas_relacionadas: [1]
    )
    
    return HistoryCardView(historia: historiaExemplo)
        .environmentObject(DataManager())
}