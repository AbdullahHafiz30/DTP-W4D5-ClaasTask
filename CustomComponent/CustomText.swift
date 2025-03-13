//
//  CustomText.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

@ViewBuilder
func customText(_ text: String,
                font: Font,
                color: Color) -> some View {
    Text(text)
        .font(font)
        .foregroundColor(color)
}
