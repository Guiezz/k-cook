struct Historia: Codable, Identifiable {
    let id: Int
    let imagem: String
    let titulo: String
    let descricao: String
    let pratosRelacionados: [PratoRelacionado]
    let receitasRelacionadas: [Int]
    
    struct PratoRelacionado: Codable {
        let nome: String
        let motivo: String
        let detalhesAdicionais: String
    }
}
