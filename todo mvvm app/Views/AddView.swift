//
//  AddView.swift
//  todo mvvm app
//
//  Created by desmond on 6/18/23.
//

import SwiftUI

struct AddView: View {
    @State var txt: String = ""
    @EnvironmentObject var listViewModel:ListViewModel
    @Environment(\.presentationMode)  var presentationMode
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Something here....", text: $txt)
                    .padding(.horizontal)
                    .frame( height: 60)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                
                Button(action:saveButton, label:{ Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:50)
                        .frame(maxWidth:.infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                    
                })
            }.padding(14)
            
        }.navigationTitle("Add an Item  ✍🏻")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButton(){
        if isAppropriate() {
            listViewModel.addItem(title: txt)
            txt = ""
            presentationMode.wrappedValue.dismiss()
        }}
        
        func isAppropriate()-> Bool{
            if txt.count < 4 {
                alertTitle = "Your new item should be 4 characters long!! 😰 "
                showAlert.toggle()
                return false
            }
            return true
        }
        
        func getAlert() -> Alert{
            return Alert(title: Text(alertTitle))
        }
    }
        
        
        struct AddView_Previews: PreviewProvider {
            static var previews: some View {
                NavigationView{
                    AddView()
                }.environmentObject(ListViewModel())
            }
        }
    

