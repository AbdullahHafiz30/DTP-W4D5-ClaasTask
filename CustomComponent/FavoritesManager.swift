//
//  FavoritesManager.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

class FavoritesManager: ObservableObject {
    // Stores a list of favorite recipes
    @Published var favoriteRecipes: [Recipe] = []
}

