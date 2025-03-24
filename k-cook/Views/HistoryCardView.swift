import SwiftUI

struct HistoryCardView: View {
    let historia: Historia
    @State private var showingDetail = false

    var body: some View {
        Button(
            action: {
                showingDetail = true
            },
            label: {
                ZStack(alignment: .bottomLeading) {
                    AsyncImage(url: URL(string: historia.imagem)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 319, height: 353)
                        } else if phase.error != nil {
                            Color.gray
                                .frame(width: 319, height: 353)
                        } else {
                            ProgressView()
                                .frame(width: 319, height: 353)
                        }
                    }
                    .clipped()
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    .clear, .black.opacity(0.5)
                                ]),
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
        )
        .buttonStyle(PlainButtonStyle())
        .sheet(
            isPresented: $showingDetail,
            content: {
                HistoryCardSheet(historia: historia)
            })
    }
}

struct HistoryCardSheet: View {
    let historia: Historia
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            HistoryDetailView(historia: historia)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(
                            action: {
                                dismiss()
                            },
                            label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            })
                    }
                }
        }
    }
}

#Preview {
    let dataManager = DataManager()
    dataManager.loadData()

    guard let receitaExemplo = dataManager.historias.first else {
        return Text("Nenhuma história disponível.")
    }

    return HistoryCardView(historia: receitaExemplo)
        .environmentObject(dataManager)
}
