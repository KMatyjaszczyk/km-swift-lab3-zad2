//
//  ContentView.swift
//  km-lab3-zad2
//
//  Created by student on 25/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State var items = ["🐸", "🙉", "🐶", "🐷", "🐰", "🦊"]
    @State var dropItems: [String] = []
    var body: some View {
        VStack {
            HStack {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .frame(minWidth: 60, minHeight: 60)
                        .background(.gray)
                        .draggable(item)
                        .font(.system(size: 50))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            DropView(title: "Drop items", items: $dropItems)
                .dropDestination(for: String.self) { dropItem, location in
                    dropItems += dropItem
                    return true
                }
        }
    }

}

#Preview {
    ContentView()
}
