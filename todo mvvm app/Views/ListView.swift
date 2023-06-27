//
//  ListView.swift
//  todo mvvm app
//
//  Created by desmond on 6/18/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView().transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(listViewModel.items){
                        item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItemModel(item: item)
                                }
                            }
                    }.onDelete(perform:listViewModel.delete)
                        .onMove(perform: listViewModel.moveItem)
                           
                }.listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List App 📝").navigationBarItems(leading: EditButton(), trailing:
        NavigationLink("Add", destination: AddView())
                                                                    
        )
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
    }
}

