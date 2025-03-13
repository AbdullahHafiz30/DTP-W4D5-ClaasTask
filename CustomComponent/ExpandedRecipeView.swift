//
//  ExpandedRecipeView.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

struct ExpandedRecipeView: View {
    let recipe: Recipe
    var animation: Namespace.ID
    var onClose: () -> Void
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(colorScheme == .dark ? Color.black : Color.white)
                .frame(width: 300, height: 400)
                .shadow(
                    color: colorScheme == .dark
                        ? Color.white.opacity(0.2)
                        : Color.black.opacity(0.2),
                    radius: 10
                )
                .matchedGeometryEffect(id: "recipe_\(recipe.id)", in: animation)
                .overlay(
                    VStack(spacing: 16) {
                        Image(recipe.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                        
                        Text(recipe.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        
                        Text(recipe.description)
                            .font(.subheadline)
                            .foregroundColor(
                                colorScheme == .dark ? .gray : .black.opacity(0.7)
                            )
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Button(action: {
                            withAnimation {
                                onClose()
                            }
                        }) {
                            Text("Close")
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                )
        }
        .padding()
    }
}

