//
//  RecipeModel.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

// MARK: - Recipe Model
struct Recipe: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let imageName: String
    let description: String
}
