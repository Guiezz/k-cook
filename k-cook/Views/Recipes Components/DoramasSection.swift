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
                        if let dorama = dataManager.doramas.first(where: { $0.id == id }) {
                            ZStack(alignment: .bottomLeading) {
                                AsyncImage(url: URL(string: dorama.imagem)) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 144, height: 187)
                                            .cornerRadius(10)
                                    case .failure:
                                        Color.gray
                                            .frame(width: 144, height: 187)
                                            .cornerRadius(10)
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 144, height: 187)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }

                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.clear, .black.opacity(0.9)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .frame(height: 60)
                                    .cornerRadius(10)
                                Text(dorama.nomePt)
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
