//
//  Historias.swift
//  k-cook
//
//  Created by User on 24/03/25.
//


struct Historias: Codable, Identifiable {
    let id: Int
    let titulo: String
    let subTitulo: String
    let descricao: String
    let pratos_relacionados: [PratoRelacionado]
    let receitas_relacionadas: [Int]
    let imagem: String
}
