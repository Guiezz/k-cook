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
            .offset(x: 10,y: 10)
            .padding(.vertical)
        }
        .sheet(item: $selectedReceita) { receita in
            RecipeDetailSheet(receita: receita)
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
