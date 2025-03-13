//
//  SettingsView.swift
//  CustomComponent
//
//  Created by Abdullah Hafiz on 13/09/1446 AH.
//

import SwiftUI

struct SettingsView: View {
    @State private var isDarkMode = false

    var body: some View {
        VStack {
            Toggle("Enable Dark Mode", isOn: $isDarkMode)
                .padding()
        }
        // Manually override color scheme
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    SettingsView()
}
