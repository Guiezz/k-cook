import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedReceita: Receita?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("K-COOK")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .fontDesign(.monospaced)
                        Spacer()
                    }
                    .padding(.horizontal)

                    // Títulos
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Hora de cozinhar!")
                            .font(.title2)
                            .fontWeight(.bold)

                        Text("O que vamos preparar?")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal)

                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(
                                [
                                    "Café da manhã", "Almoço", "Jantar",
                                    "Sobremesa",
                                ],
                                id: \.self
                            ) { refeicao in
                                Button(action: {
                                    // Adicionar ações de filtro dps
                                }) {
                                    VStack {
                                        Text(refeicao)
                                            .font(.caption)
                                    }
                                    .padding()
                                    .background(Color(.systemBackground))
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.blue, lineWidth: 5)
                                    )
                                }
                            }
                        }
                        .padding()
                    }
                    .padding()

                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Receitas")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            Spacer()

                            NavigationLink(destination: AllRecipesView()) {
                                Text("Ver tudo")
                                    .foregroundColor(.red)
                                    .font(.callout)
                                    .padding(.horizontal)
                            }
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(dataManager.receitas) { receita in
                                    RecipeCardView(receita: receita)
                                        .frame(width: 147)
                                        .onTapGesture {
                                            selectedReceita = receita
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .sheet(item: $selectedReceita) { receita in
                RecipeDetailSheet(receita: receita)
            }
        }
    }
}

#Preview {

    HomeView()
           .environmentObject(DataManager())

}
