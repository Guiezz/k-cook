struct PreparationSection: View {
    let passos: [PassoPreparo]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Modo de Preparo")
                .font(.headline)
            
            ForEach(passos) { passo in
                VStack(alignment: .leading, spacing: 5) {
                    Text("Passo \(passo.id):")
                        .font(.subheadline)
                        .bold()
                    Text(passo.passo)
                        .font(.subheadline)
                }
                .padding(.vertical, 5)
            }
        }
        .padding(.vertical)
    }
}