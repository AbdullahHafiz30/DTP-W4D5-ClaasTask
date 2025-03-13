//
//  RecipeCard.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 5)
                .padding(.top)
            
            Text(recipe.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(recipe.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)

            Spacer()
        }
        .frame(width: 200, height: 280)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    colorScheme == .dark
                        ? Color.black.opacity(0.8)
                        : Color.white
                )
        )
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    RecipeCard(
        recipe: Recipe(title: "Pizza Margherita",
                       imageName: "recipe1",
                       description: "Tomato sauce, fresh mozzarella, and basil")
    )
}
