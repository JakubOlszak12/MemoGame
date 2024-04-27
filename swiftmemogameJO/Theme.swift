//
//  Theme.swift
//  swiftmemogameJO
//
//  Created by student on 27/4/24.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case emojis
    case animals
    case flags
    
    var symbols: [String] {
        switch self {
        case .emojis:
            return ["😀", "😁", "😂", "🤣", "😃", "😄", "😅", "😆","🤬","😎"]
        case .animals:
            return ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼","🙈","🐷"]
        case .flags:
            return ["🇺🇸", "🇬🇧", "🇫🇷", "🇩🇪", "🇯🇵", "🇨🇳", "🇮🇳", "🇷🇺","🇸🇪","🏳️‍🌈"]
        }
    }
    
    var color: Color {
        switch self {
        case .emojis:
            return .blue
        case .animals:
            return .green
        case .flags:
            return .red
        }
    }
}

struct ThemeButton: View {
    var theme: Theme
    @Binding var selectedTheme: Theme
    
    var body: some View {
        Button(action: {
            selectedTheme = theme
        }) {
            VStack {
                Image(systemName: theme == selectedTheme ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(theme.color)
                    .font(.title)
                Text(theme.rawValue.capitalized)
                    .font(.caption)
            }
        }
    }
    
    
}
