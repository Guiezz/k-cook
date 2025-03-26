import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedReceita: Receita?
    @State private var selectedHistoria: Historias?
    @State private var dailyReceita: Receita?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Hora de cozinhar!")
                                .font(.title2)
                                .fontWeight(.bold)

                            Text("O que vamos preparar?")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                        .padding(.horizontal)

                        VStack {
                            if let dailyReceita = dailyReceita {
                                DailyRecipeCardView(receita: dailyReceita)
                                    .padding(.horizontal)
                            } else {
                                ProgressView()
                                    .frame(height: 248)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.bottom)

                    VStack(alignment: .leading) {
                        HStack {
                            Text("Adicionadas Recentemente")
                                .font(.headline)
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
                                .font(.headline)
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
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Receitas Favoritas")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            Spacer()
                        }

                        if dataManager.receitas.contains(where: {
                            $0.isFavorited
                        }) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(
                                        dataManager.receitas.filter {
                                            $0.isFavorited
                                        }
                                    ) { receita in
                                        RecipeCardView(receita: receita)
                                            .onTapGesture {
                                                selectedReceita = receita
                                            }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        } else {
                            Text("Nenhuma receita favoritada ainda.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.top)

                }
                .padding(25)
            }
            .onAppear {
                updateDailyRecipe()
            }
            .onReceive(dataManager.$receitas) { _ in
                updateDailyRecipe()
            }
        }
    }

    private func updateDailyRecipe() {
        dailyReceita = dataManager.receitas.randomElement()
    }
}

#Preview {
    HomeView()
        .environmentObject(DataManager())
}
