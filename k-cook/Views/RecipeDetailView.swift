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
                            Text(receita.tempo_preparo)
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
                    
                    DoramasSection(doramaIDs: receita.dorama_ids)
                    
                    IngredientsSection(ingredientes: receita.ingredientes)
                    
                    PreparationSection(passos: receita.preparo)
                }
                .padding()
            }
        }
        .navigationTitle(receita.nome)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // Botão Voltar
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    // Ação de voltar já implementada
                } label: {
                    Label("Voltar", systemImage: "arrow.left")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 16) {
                    // Botão Favorito
                    Button {
                        // Implementação futura
                    } label: {
                        Image(systemName: "heart")
                            .font(.system(size: 20))
                            .foregroundColor(.red)
                    }
                    
                    ShareLink(item: receita.nome) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 20))
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        RecipeDetailView(receita: DataManager().receitas[1])
            .environmentObject(DataManager())
    }
}
