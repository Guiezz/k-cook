import SwiftUI

struct RecipeCardView: View {
    let receita: Receita

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: receita.imagem)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 250, height: 150)
            .scaledToFit()
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(receita.nome)
                    .font(.headline)
                Text(
                    "\(receita.tempo_preparo) • \(receita.porcoes) • \(receita.dificuldade)"
                )
                .font(.subheadline)
            }
        }
    }
}

#Preview {

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
    return RecipeCardView(receita: receitaExemplo)
}
