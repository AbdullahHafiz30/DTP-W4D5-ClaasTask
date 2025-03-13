//
//  CustomComponentApp.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

@main
struct CustomComponentApp: App {
    @StateObject var favorites = FavoritesManager()  // Holds favorite recipes
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(favorites)
        }
    }
}
