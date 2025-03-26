struct Receita: Codable, Identifiable {
    let id: Int
    let nome: String
    let dorama_ids: [Int]
    let tempo_preparo: String
    let porcoes: String
    let dificuldade: String
    let refeicao: String
    let descricao_curta: String
    let ingredientes: [Ingrediente]
    let equipamento: [String]
    let preparo: [PassoPreparo]
    let curiosidades_culturais: [String]
    let dicas_truques: [String]
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
        case descricao_curta
        case ingredientes
        case equipamento
        case preparo
        case curiosidades_culturais
        case dicas_truques
        case imagem
    }
}
