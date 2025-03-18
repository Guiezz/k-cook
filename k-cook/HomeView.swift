//
//  Home.swift
//  k-cook
//
//  Created by found on 18/03/25.
//

import SwiftUI
struct Home: View {
    @State private var searchText = ""
    var body: some View {
            VStack{
                HStack{
                    Text("K-COOK")
                        .font(.largeTitle)
                        .fontDesign(.monospaced)
                        .bold()
                        .padding()
                        .foregroundColor(.red)
                        .offset(x:0, y:0)
                    
                    HStack {
                        NavigationStack{
                            Text(" \(searchText)")
                            Spacer()
                        }
                    }
                    
                    VStack{
                        Button(action:{
                            print("Selecionado")
                        }){
                            Text("Café da manhã")
                            
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(20)
                                .shadow(radius: 2)
                        }
                        Button(action:{
                            print("Selecionado")
                        }){
                            Text("Almoço")
                            
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                        }
                        Button(action:{
                            print("Selecionado")
                        }){
                            Text("Jantar")
                            
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                        }
                        Button(action:{
                            print("selecionado")
                        }){
                            Text("Sobremesa")
                            
                            
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                            
                        }
                    }
                }
            }
        }
    }

#Preview {
    Home()
}
