//
//  CustomButton.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomButton(title: "This is a Custom Button") {
        // Your action
    }
}
