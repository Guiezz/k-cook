import SwiftUI

struct AllRecipesView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedReceita: Receita?
    @State private var selectedFilter: String?

    @Environment(\.dismiss) private var dismiss

    private var filteredReceitas: [Receita] {
        guard let filter = selectedFilter else { return dataManager.receitas }
        return dataManager.receitas.filter { $0.refeicao == filter }
    }

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    Button(action: {
                        selectedFilter = nil
                    }) {
                        FilterCapsuleView(
                            title: "Todos",
                            isSelected: selectedFilter == nil
                        )
                    }

                    ForEach(
                        [
                            "Café da manhã", "Almoço", "Jantar", "Sobremesa",
                        ], id: \.self
                    ) { refeicao in
                        Button(action: {
                            selectedFilter =
                                (selectedFilter == refeicao) ? nil : refeicao
                        }) {
                            FilterCapsuleView(
                                title: refeicao,
                                isSelected: selectedFilter == refeicao
                            )
                        }
                    }
                }
            }
            .padding()

            ScrollView(.vertical) {
                VStack(spacing: 15) {
                    ForEach(filteredReceitas) { receita in
                        AllRecipesCardView(receita: receita)
                            .aspectRatio(0.7, contentMode: .fit)
                            .onTapGesture {
                                selectedReceita = receita
                            }
                    }
                }
                .padding(.vertical)
            }
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


struct FilterCapsuleView: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(isSelected ? .white : .black)
            .fontWeight(.bold)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(isSelected ? Color.red : Color.white.opacity(0.2))
                    .overlay(
                        Capsule()
                            .stroke(
                                isSelected ? Color.red : Color.black,
                                lineWidth: 1)
                    )
            )
    }
}

#Preview {
    NavigationStack {
        AllRecipesView()
            .environmentObject(DataManager())
    }
}
