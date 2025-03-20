//
//  DoramasSection.swift
//  k-cook
//
//  Created by User on 20/03/25.
//

import SwiftUI

struct DoramasSection: View {
    let doramaIDs: [Int]
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Doramas Relacionados")
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(doramaIDs, id: \.self) { id in
                        if let dorama = dataManager.doramas.first(where: {
                            $0.id == id
                        }) {
                            VStack {
                                AsyncImage(url: URL(string: dorama.imagem)) {
                                    phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                    } else if phase.error != nil {
                                        Color.gray
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                    } else {
                                        ProgressView()
                                            .frame(width: 100, height: 100)
                                    }
                                }

                                Text(dorama.nome_pt)
                                    .font(.caption)
                                    .lineLimit(1)
                            }
                            .frame(width: 100)
                        }
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    let dataManager = DataManager()

    dataManager.loadData()

    return DoramasSection(doramaIDs: [1, 2, 3, 4, 5])
        .environmentObject(dataManager)
}
