//
//  HomeView.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

struct HomeView: View {
    let viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    // Each recipe leads to a detail view
                    ForEach(viewModel.recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeCard(recipe: recipe)
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    HomeView()
}
