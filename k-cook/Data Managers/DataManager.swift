import Foundation

class DataManager: ObservableObject {
    @Published var doramas: [Dorama] = []
    @Published var receitas: [Receita] = []
    @Published var historias: [Historias] = []
    
    init() {
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
            
            
            doramas = decodedData.doramas
            receitas = decodedData.receitas
            historias = decodedData.historias
        } catch {
            print("Erro na decodificação: \(error.localizedDescription)")
        }
    }
    
    
    private struct DataModel: Codable {
        let doramas: [Dorama]
        let receitas: [Receita]
        let historias: [Historias]
    }
}
