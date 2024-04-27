//
//  ContentView.swift
//  swiftmemogameJO
//
//  Created by student on 27/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var contents = Theme.emojis.symbols.shuffled()
    @State private var selectedTheme = Theme.emojis
    @State private var numberOfCards = 4
    
    let columns = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                .padding()
            HStack {
                ThemeButton(theme: .emojis, selectedTheme: $selectedTheme)
                ThemeButton(theme: .animals, selectedTheme: $selectedTheme)
                ThemeButton(theme: .flags, selectedTheme: $selectedTheme)
            }
            .padding()
            
            HStack {
                adjustCardNumber(by: 2, symbol: "plus.square.fill").padding()
                Spacer()
                adjustCardNumber(by: -2, symbol: "minus.square.fill").padding()
            }
            .padding()
            
            Spacer()
            
            cardDisplay
                .foregroundColor(Color.blue)
            
        }
        .onChange(of: selectedTheme) {
            contents = selectedTheme.symbols.shuffled()
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(
            action:{
                numberOfCards += offset
            },
            label: {
                Image(systemName: symbol).font(.largeTitle)
            }
        ).disabled(numberOfCards + offset < 2 || numberOfCards + offset > selectedTheme.symbols.count)
    }
    
    var cardDisplay: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(contents.prefix(numberOfCards).indices, id: \.self) { index in
                    CardView(content: contents[index], color: selectedTheme.color)
                }
            }
            .padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
