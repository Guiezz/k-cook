struct Historias: Codable, Identifiable {
    let id: Int
    let titulo: String
    let descricao: String
    let pratos_relacionados: [PratoRelacionado]
    let receitas_relacionadas: [Int] // Adicione este campo
}