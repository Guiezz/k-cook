import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedReceita: Receita?
    @State private var selectedDorama: Dorama?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("K-COOK")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .fontDesign(.monospaced)
                        .offset(x:0, y:39)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hora de cozinhar!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .offset(x:0, y:42)
                    
                    Text("Oque vamos preparar?")
                        .font(.title3)
                        .fontWeight(.bold)
                        .offset(x:0, y:35)
                }
                .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 10) {
                        ForEach(
                            ["Café da manhã", "Almoço", "Jantar", "Sobremesa"],
                            id: \.self
                        ) { refeicao in
                            Button(action: {
                                // Adicionar ações de filtro dps
                            }) {
                                VStack {
                                    Text(refeicao)
                                        .font(.caption)
                                        .foregroundColor(.black)
                                        .fontWeight(.bold)
                                }
                                .frame(width: 90 , height: 1, alignment: .center)
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
                    Text("Receitas")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
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
                    Text("Doramas")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal){
                        HStack(spacing:15){
                            ForEach(dataManager.doramas) { dorama in
                                DoramasSection(doramaIDs: [1, 2, 3, 4, 5])
                                    .frame(width: 147)
                                    .onTapGesture {
                                        selectedDorama = dorama
                                    }
                            }
                        }
                    }
                }
                .offset(x:0, y:-37)
                .padding(.vertical)
            }
            .sheet(item: $selectedReceita) { receita in
                RecipeDetailSheet(receita: receita)
            }
//            .sheet(item: $selectedDorama) { dorama in
//                DoramasSection(dorama: dorama)
                
            }
        
        
//        private func refeicaoIcon(for refeicao: String) -> String {
//            switch refeicao {
//            case "Café da manhã": return "cup.and.saucer.fill"
//            case "Almoço": return "fork.knife"
//            case "Jantar": return "sunset.fill"
//            case "Sobremesa": return "apple.logo"
//            default: return "questionmark"
//            }
        }
    }
    
    #Preview {
        let dataManager = DataManager()
        dataManager.loadData()
        
        return HomeView()
            .environmentObject(dataManager)
    }


