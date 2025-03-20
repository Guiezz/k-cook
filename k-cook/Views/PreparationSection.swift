//
//  PreparationSection.swift
//  k-cook
//
//  Created by User on 20/03/25.
//

import SwiftUI

struct PreparationSection: View {
    let passos: [PassoPreparo]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Modo de Preparo")
                .font(.headline)
            
            ForEach(passos) { passo in
                VStack(alignment: .leading, spacing: 5) {
                    Text("Passo \(passo.id):")
                        .font(.subheadline)
                        .bold()
                    Text(passo.passo)
                        .font(.subheadline)
                }
                .padding(.vertical, 5)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    let dataManager = DataManager()
    
    dataManager.loadData()
    
    let passosExemplo = dataManager.receitas.first?.preparo ?? []
    
    return PreparationSection(passos: passosExemplo)
        .environmentObject(dataManager)

}
