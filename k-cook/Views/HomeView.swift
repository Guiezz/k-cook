import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedReceita: Receita?
    @State private var selectedDorama: Dorama?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                   

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Hora de cozinhar!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .offset(x: 0, y: 42)
                        
                        Text("O que vamos preparar?")
                            .font(.title2)
                            .fontWeight(.bold)
                            .offset(x: 0, y: 35)
                    }
                    .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(
                                ["Café da manhã", "Almoço", "Jantar", "Sobremesa"],
                                id: \.self
                            ) { refeicao in
                                Button(action: {}) {
                                    VStack {
                                        Text(refeicao)
                                            .font(.caption)
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                    }
                                    .frame(width: 90, height: 1, alignment: .center)
                                    .padding()
                                    .background(Color.white.opacity(0.2))
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 18)
                                            .stroke(.black, lineWidth: 1)
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
                            HStack(spacing: 100) {
                                ForEach(dataManager.receitas) { receita in
                                    RecipeCardView(receita: receita)
                                        .frame(width: 175)
                                        .onTapGesture {
                                            selectedReceita = receita
                                        }
                                }
                            }
                            .offset(x:42, y:0)
                            .padding(.horizontal)
                        }
                    }
                    .offset(x: 0, y: -37)

//                    VStack(alignment: .leading) {
//                        HStack {
//                            Text("Doramas")
//                                .font(.title2)
//                                .fontWeight(.bold)
//                                .padding(.horizontal)
//                            Spacer()
//                        }
//                        
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack(spacing: 15) {
//                                ForEach(dataManager.doramas) { dorama in
//                                    DoramasSection(doramaIDs: [1, 2, 3, 4, 5])
//                                        .frame(width: 147)
//                                        .onTapGesture {
//                                            selectedDorama = dorama
//                                        }
//                                }
//                            }
//                            .padding(.horizontal)
//                        }
//                    }
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
