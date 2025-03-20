struct RecipeDetailView: View {
    let receita: Receita
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: receita.imagem)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                    }
                }
                
                // Seção de Doramas relacionados
                DoramasSection(doramaIDs: receita.dorama_ids)
                
                // Seção de Ingredientes
                IngredientsSection(ingredientes: receita.ingredientes)
                
                // Seção de Preparo
                PreparationSection(passos: receita.preparo)
            }
            .padding()
        }
        .navigationTitle(receita.nome)
    }
}