//
//  ListRowView.swift
//  todo mvvm app
//
//  Created by desmond on 6/18/23.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName:item.isComplete ? "checkmark.circle":"circle" ).foregroundColor(item.isComplete ? Color.green: Color.red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item = ItemModel(title: "First item", isComplete: false)
    static var item2 = ItemModel(title: "Second item", isComplete: true)
    
    static var previews: some View {
        Group{
            ListRowView(item: item)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
