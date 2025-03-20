struct IngredientsSection: View {
    let ingredientes: [Ingrediente]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ingredientes")
                .font(.headline)
            
            ForEach(ingredientes) { ingrediente in
                Text("• \(ingrediente.nome)")
                    .font(.subheadline)
            }
        }
        .padding(.vertical)
    }
}