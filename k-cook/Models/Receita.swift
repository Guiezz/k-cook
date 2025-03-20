//
//  Receita.swift
//  k-cook
//
//  Created by User on 20/03/25.
//


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
}