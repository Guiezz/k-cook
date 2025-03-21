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
                            ZStack(alignment: .bottomLeading) {
                                AsyncImage(url: URL(string: dorama.imagem)) {
                                    phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 144, height: 187)
                                            .cornerRadius(10)
                                    } else if phase.error != nil {
                                        Color.gray
                                            .frame(width: 144, height: 187)
                                            .cornerRadius(10)
                                    } else {
                                        ProgressView()
                                            .frame(width: 144, height: 187)
                                    }
                                }

                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                .clear, .black.opacity(0.9),
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .frame(height: 60)
                                    .cornerRadius(10)
                                    

                                Text(dorama.nome_pt)
                                    .foregroundColor(.white)
                                    .font(.caption)
                                    .lineLimit(2)
                                    .padding([.bottom, .leading], 8)
                            }
                            .frame(width: 144, height: 187)
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
