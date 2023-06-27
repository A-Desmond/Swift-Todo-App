//
//  todo_mvvm_appApp.swift
//  todo mvvm app
//
//  Created by desmond on 6/18/23.
//

import SwiftUI

@main
struct todo_mvvm_appApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}


