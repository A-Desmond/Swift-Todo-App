//
//  itemsModel.swift
//  todo mvvm app
//
//  Created by desmond on 6/19/23.
//

import Foundation


struct ItemModel: Identifiable, Codable{
    let id:String
    let title: String
    let isComplete:Bool
    
    
    init(id:String = UUID().uuidString, title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    func updateItemModel() -> ItemModel{
        return ItemModel(id:id, title: title, isComplete: !isComplete)
    }
}
