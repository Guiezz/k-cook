import SwiftData
import Foundation

@MainActor
class DataManager: ObservableObject {
    @Published var doramas: [Dorama] = []
    @Published var receitas: [Receita] = []
    @Published var historias: [Historias] = []

    private let container: ModelContainer
    private let context: ModelContext
    
    init() {
        do {
            container = try ModelContainer(for: ReceitaFavorita.self)
            context = container.mainContext
        } catch {
            fatalError("Falha crítica ao inicializar SwiftData: \(error)")
        }
        
        loadData()
    }
    func loadData() {
        guard let url = Bundle.main.url(forResource: "receitas", withExtension: "json") else {
            print("JSON não encontrado!")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(DataModel.self, from: data)

            // Busca favoritos com tratamento de erro
            do {
                let favoritos = try context.fetch(FetchDescriptor<ReceitaFavorita>())
                let idsFavoritos = favoritos.map { $0.recipeId }
                
                receitas = decodedData.receitas.map { receita in
                    var modReceita = receita
                    modReceita.isFavorited = idsFavoritos.contains(receita.id)
                    return modReceita
                }
            } catch {
                print("Erro ao carregar favoritos: \(error.localizedDescription)")
            }

            doramas = decodedData.doramas
            historias = decodedData.historias

        } catch {
            print("Erro geral: \(error.localizedDescription)")
        }
    }

    func toggleFavorito(receitaId: Int) {
        if let index = receitas.firstIndex(where: { $0.id == receitaId }) {
            var updatedReceitas = receitas
            updatedReceitas[index].isFavorited.toggle()
            receitas = updatedReceitas

            do {
                if updatedReceitas[index].isFavorited {
                    let novoFavorito = ReceitaFavorita(recipeId: receitaId)
                    context.insert(novoFavorito)
                } else {
                    let request = FetchDescriptor<ReceitaFavorita>()
                    if let favorito = (try? context.fetch(request))?.first(where: { $0.recipeId == receitaId }) {
                        context.delete(favorito)
                    }
                }
                try context.save()
            } catch {
                print("Erro ao salvar favorito: \(error.localizedDescription)")
            }
        }
    }

}


private struct DataModel: Codable {
    let doramas: [Dorama]
    let receitas: [Receita]
    let historias: [Historias]
}
