import SwiftUI

struct AllRecipesView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedReceita: Receita?

    @Environment(\.dismiss) private var dismiss

    private let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(
                    [
                        "Café da manhã", "Almoço", "Jantar",
                        "Sobremesa",
                    ],
                    id: \.self
                ) { refeicao in
                    Button(
                        action: {},
                        label: {
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
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                ForEach(dataManager.receitas) { receita in
                    RecipeCardView(receita: receita)
                        .aspectRatio(0.7, contentMode: .fit)
                        .onTapGesture {
                            selectedReceita = receita
                        }
                }
            }
            .offset(x: 10, y: 10)
            .padding(.vertical)
        }
        .navigationTitle("Todas as receitas")
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

    AllRecipesView()
        .environmentObject(DataManager())
}
