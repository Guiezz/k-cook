//
//  SplashView.swift
//  k-cook
//
//  Created by User on 26/03/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    var body: some View {

        if isActive {
            HomeView()
                .environmentObject(DataManager())
        } else {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                Image("KcookLogo")
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
