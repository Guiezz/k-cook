import SwiftUI

struct RecipeCardView: View {
    let receita: Receita
    @State private var showingDetail = false

    var body: some View {
        Button(action: {
            showingDetail = true
        }, label: {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: receita.imagem)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 260, height: 127)
                    } else if phase.error != nil {
                        Color.gray
                            .frame(width: 260, height: 127)
                    } else {
                        ProgressView()
                            .frame(width: 260, height: 127)
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
                    Text(receita.nome)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("\(receita.tempoPreparo) | \(receita.dificuldade)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding(10)
            }
            .frame(width: 260, height: 127)
            .cornerRadius(14)
            .clipped()
        })
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showingDetail, content: {
            RecipeDetailSheet(receita: receita)
        })
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
                        Button(action: {
                            dismiss()
                        }, label: {
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
    let receitaExemplo = dataManager.receitas[0]

    return RecipeCardView(receita: receitaExemplo)
        .environmentObject(dataManager)
}
