import SwiftUI

struct AllFavoriteRecipesView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedReceita: Receita?
    @Environment(\.dismiss) private var dismiss

    
    var favoritos: [Receita] {
        dataManager.receitas.filter { $0.isFavorited }
    }

    var body: some View {
        VStack {
            if favoritos.isEmpty {
                VStack(spacing: 10) {
                    Image(systemName: "heart.slash.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                    
                    Text("Nenhuma receita favoritada ainda!")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    
                    Text("Comece a favoritar receitas para encontrá-las facilmente aqui.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                }
                .padding(.top, 50)
            } else {
                ScrollView(.vertical) {
                    VStack(spacing: 15) {
                        ForEach(favoritos) { receita in
                            AllRecipesCardView(receita: receita)
                                .aspectRatio(0.7, contentMode: .fit)
                                .onTapGesture {
                                    selectedReceita = receita
                                }
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
        .navigationTitle("Receitas Favoritas ")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Label("Back", systemImage: "arrow.left")
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
        AllFavoriteRecipesView()
            .environmentObject(DataManager())
    }
}
