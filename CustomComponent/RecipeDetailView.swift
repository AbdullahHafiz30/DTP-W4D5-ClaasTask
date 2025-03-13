//
//  RecipeDetailView.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @EnvironmentObject var favorites: FavoritesManager
    
    var body: some View {
        VStack(spacing: 20) {
            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .shadow(radius: 5)
            
            Text(recipe.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(recipe.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
            
            // Add / Remove Favorite
            Button(action: {
                if favorites.favoriteRecipes.contains(where: { $0.id == recipe.id }) {
                    favorites.favoriteRecipes.removeAll { $0.id == recipe.id }
                } else {
                    favorites.favoriteRecipes.append(recipe)
                }
            }) {
                Text(
                    favorites.favoriteRecipes.contains(where: { $0.id == recipe.id })
                        ? "Remove from Favorites"
                        : "Add to Favorites"
                )
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .navigationTitle(recipe.title)
    }
}

#Preview {
    RecipeDetailView(
        recipe: Recipe(title: "Cheesecake",
                       imageName: "recipe3",
                       description: "Creamy cheesecake with a graham cracker crust.")
    )
    .environmentObject(FavoritesManager())
}
