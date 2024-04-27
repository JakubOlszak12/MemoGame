//
//  CardView.swift
//  swiftmemogameJO
//
//  Created by student on 27/4/24.
//
import SwiftUI
struct CardView: View {
    var content: String
    var color: Color
    
    @State private var isFaceUp = false
    
    var body: some View {
        Group {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .stroke(color, lineWidth: 2)
                    .overlay(
                        Text(content)
                            .font(.largeTitle)
                    )
                    .aspectRatio(2/3, contentMode: .fill)
                  
                    .foregroundColor(color)
                    .onTapGesture {
                        withAnimation {
                            isFaceUp.toggle()
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(color)
                    .aspectRatio(2/3, contentMode: .fill)
                    
                    .onTapGesture {
                        withAnimation {
                            isFaceUp.toggle()
                        }
                    }
            }
        }
        .opacity(isFaceUp ? 1 : 1)
    }
}

