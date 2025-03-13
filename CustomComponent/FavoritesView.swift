//
//  FavoritesView.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @Namespace private var animation // For matchedGeometryEffect
    @State private var selectedRecipe: Recipe? // Tracks which recipe is expanded
    
    var body: some View {
        ZStack {
            VStack {
                if favoritesManager.favoriteRecipes.isEmpty {
                    VStack(spacing: 10) {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)

                        customText("No Favorites Available",
                                   font: .headline,
                                   color: .gray)
                        customText("Add a favorite recipe to see it here.",
                                   font: .subheadline,
                                   color: .gray)
                    }
                    .padding()
                } else {
                    NavigationView {
                        ScrollView {
                            GeometryReader { geometry in
                                // Adaptive columns
                                let columns = max(Int(geometry.size.width / 200), 1)
                                let gridLayout = Array(
                                    repeating: GridItem(.flexible(), spacing: 20),
                                    count: columns
                                )
                                
                                LazyVGrid(columns: gridLayout, spacing: 20) {
                                    ForEach(favoritesManager.favoriteRecipes) { recipe in
                                        // If this recipe is currently selected (expanded),
                                        // place a "Color.clear" placeholder so it doesn't appear twice.
                                        if selectedRecipe?.id == recipe.id {
                                            Color.clear
                                        } else {
                                            RecipeCard(recipe: recipe)
                                                .matchedGeometryEffect(
                                                    id: "recipe_\(recipe.id)",
                                                    in: animation,
                                                    isSource: selectedRecipe == nil
                                                )
                                                .onTapGesture {
                                                    withAnimation(.spring()) {
                                                        selectedRecipe = recipe
                                                    }
                                                }
                                        }
                                    }
                                }
                                .padding()
                            }
                            .frame(height: UIScreen.main.bounds.height - 150)
                        }
                        .navigationTitle("Favorites")
                    }
                }
            }
            
            // Overlay for Expanded Recipe View
            if let selectedRecipe = selectedRecipe {
                ExpandedRecipeView(recipe: selectedRecipe, animation: animation) {
                    withAnimation(.spring()) {
                        self.selectedRecipe = nil
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    // Tap outside to close
                    withAnimation {
                        self.selectedRecipe = nil
                    }
                }
            }
        }
    }
}

#Preview {
    let manager = FavoritesManager()
    manager.favoriteRecipes = [
        Recipe(title: "Spaghetti Bolognese", imageName: "recipe1", description: "Classic Italian pasta dish"),
        Recipe(title: "Chocolate Cake", imageName: "recipe2", description: "Rich and moist chocolate cake")
    ]
    
    return FavoritesView()
        .environmentObject(manager)
}
