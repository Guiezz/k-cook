import SwiftUI

struct HomeView: View {
    @State private var showingSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("K-COOK")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .fontDesign(.monospaced)
                Spacer()
            }
            .offset(x:15, y:-120)
        }
        
        VStack(alignment: .leading, spacing: 20) {
            Text("O que vamos preparar?")
                .font(.custom("Poppins-Bold", size: 25))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .fontDesign(.default)
                .offset(x:15, y:-69)
            
            Text("Hora de cozinhar!")
                .font(.custom("Poppins-Bold", size: 25))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .fontDesign(.default)
                .offset(x:15, y:-150)
        }
        .offset(x:-65, y:-0)
        
        VStack{
            HStack(spacing: 40){
                Button(action: {
                    print("Teste")
                }) {
                    VStack{
                        Image(systemName: "cup.and.saucer.fill")
                        Text("Café da manhã")
                    }
                    .border(Color.black, width: 1)
                }
                Button(action: {
                    print("Teste")
                }) {
                    VStack {
                        Image(systemName: "cup.and.saucer.fill")
                        Text("Almoço")
                    }
                    .border(Color.black, width: 1)
                }
                Button(action: {
                    print("Teste")
                }) {
                    VStack {
                        Image(systemName: "sunrise.fill")
                        Text("Jantar")
                    }
                    .border(Color.black, width: 1)
                }
            }
            .offset(x:0, y:-100)
        }
            
            
            
    
            VStack{
                Text("Receitas")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .fontDesign(.default)
                    .offset(x:-124, y:20)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20){
                        ForEach(0..<5){_ in
                            Image(systemName: "star.fill")
                        }
                        Text("aaaaaaa")
                        Text("bbbbbbb")
                        Text("ccccccc")
                        
                    }
                }
                .padding()
            }
            .offset(x:-1, y:0)
            
            VStack{
                Text("Doramas")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .fontDesign(.default)
                    .offset(x:-124, y:20)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20){
                        Image(systemName: "star.fill")
                        Text("aaaaaaa")
                        Text("bbbbbbb")
                        Text("ccccccc")
                    }
                }
                .padding()
            }
            .offset(x:-1, y:0)
            
            VStack{
                Text("Histórias")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .fontDesign(.default)
                    .offset(x:-124, y:20)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20){
                        Image(systemName: "star.fill")
                        Text("aaaaaaa")
                        Text("bbbbbbb")
                        Text("ccccccc")
                    }
                }
                .padding()
            }
        
    }
}
#Preview {
    HomeView()
}
