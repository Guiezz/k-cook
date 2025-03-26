struct Receita: Codable, Identifiable {
    let id: Int
    let nome: String
    let dorama_ids: [Int]
    let tempo_preparo: String
    let porcoes: String
    let dificuldade: String
    let refeicao: String
    let ingredientes: [Ingrediente]
    let preparo: [PassoPreparo]
    let imagem: String
    var isFavorited: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case nome
        case dorama_ids
        case tempo_preparo
        case porcoes
        case dificuldade
        case refeicao
        case ingredientes
        case preparo
        case imagem
    }
}
