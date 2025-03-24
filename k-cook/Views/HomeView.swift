import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedReceita: Receita?
    @State private var selectedHistoria: Historias?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Hora de cozinhar!")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.red)

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
                                        "Sobremesa"
                                    ],
                                    id: \.self
                                ) { refeicao in
                                    Button(action: {}, label: {
                                        VStack {
                                            Text(refeicao)
                                                .font(.caption)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                        }
                                        .frame(
                                            width: 90, height: 1,
                                            alignment: .center
                                        )
                                        .padding()
                                        .background(Color.white.opacity(0.2))
                                        .cornerRadius(20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 18)
                                                .stroke(.black, lineWidth: 1)
                                        )
                                    })
                                }
                            }
                        }
                        .padding()
                    }

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
                                        .onTapGesture {
                                            selectedReceita = receita
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    VStack(alignment: .leading) {
                        HStack {
                            Text("Histórias Coreanas")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            Spacer()
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(dataManager.historias) { historia in
                                    HistoryCardView(historia: historia)
                                        .onTapGesture {
                                            selectedHistoria = historia
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
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
