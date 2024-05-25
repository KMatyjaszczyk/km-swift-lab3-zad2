//
//  DropView.swift
//  km-lab3-zad2
//
//  Created by student on 25/05/2024.
//

import SwiftUI

struct DropView: View {
    var title: String
    @Binding var items: [String]
    var body: some View {
        VStack {
            Text("\(title): \(items.count)")
                .font(.title)
                .padding()
            List {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Text(item)
                            .frame(minWidth: 60, minHeight: 60)
                            .background(.gray)
                            .font(.system(size: 50))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                    }
                }.onDelete(perform: delete)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    private func delete (at offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
}


#Preview {
    DropView(title: "Drop items", items: .constant(["🐸", "🙉"]))
}
