//
//  ListViewModel.swift
//  todo mvvm app
//
//  Created by desmond on 6/21/23.
//

import Foundation


class ListViewModel: ObservableObject{
    @Published var items:[ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemsKey:String  = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedItems
        
    }
    
    
    func delete(indexSet: IndexSet){
         items.remove(atOffsets: indexSet)
     }
   
     func moveItem(from:IndexSet, to:Int){
         items.move(fromOffsets: from, toOffset: to)
     }
    
    func addItem(title:String){
        let item = ItemModel(title: title, isComplete: false)
        items.append(item)
    }
    
    func updateItemModel(item:ItemModel){
        if let index = items.firstIndex(where: { ($0.id == item.id) }){
            items[index] = item.updateItemModel()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey:itemsKey)
        }
    }
}
