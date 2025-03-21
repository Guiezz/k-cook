//
//  k_cookApp.swift
//  k-cook
//
//  Created by User on 18/03/25.
//

import SwiftUI
import SwiftData

@main
struct k_cookApp: App {
    var body: some Scene {
        
        let receitaExemplo = Receita(
            id: 1,
            nome: "Kimbap",
            dorama_ids: [1, 2],
            tempo_preparo: "30 minutos",
            porcoes: "4 porções",
            dificuldade: "Média",
            refeicao: "Lanche",
            ingredientes: [
                Ingrediente(id: 1, nome: "2 xícaras de arroz cozido"),
                Ingrediente(id: 2, nome: "1 colher de sopa de óleo de gergelim"),
            ],
            preparo: [
                PassoPreparo(
                    id: 1,
                    passo: "Misture o arroz cozido com óleo de gergelim e sal.")
            ],
            imagem:
                "https://p2.trrsf.com/image/fget/cf/1200/630/middle/images.terra.com/2023/09/22/788421434-tamanho-padrao-gc-64.jpg"
        )

        
        WindowGroup {
            RecipeDetailView(receita: receitaExemplo)
        }
    }
}
