struct Receita: Codable, Identifiable {
    let id: Int
    let nome: String
    let doramaIds: [Int]
    let tempoPreparo: String
    let porcoes: String
    let dificuldade: String
    let refeicao: String
    let ingredientes: [Ingrediente]
    let preparo: [PassoPreparo]
    let imagem: String
    struct Ingrediente: Codable, Identifiable {
        let id: Int
        let nome: String
    }
    struct PassoPreparo: Codable, Identifiable {
        let id: Int
        let passo: String
    }
}
