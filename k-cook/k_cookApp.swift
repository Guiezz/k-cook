//
//  k_cookApp.swift
//  k-cook
//
//  Created by User on 18/03/25.
//

import SwiftUI

@main
struct k_cookApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(DataManager())
        }
    }
}
