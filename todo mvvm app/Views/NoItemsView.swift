//
//  NoItemsView.swift
//  todo mvvm app
//
//  Created by desmond on 6/24/23.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let secondartAccentColor = Color("SecondaryColor")
    var body: some View {
        ScrollView{
            VStack(spacing:10){
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Tap Add button to add an item to your Todo list").padding(.bottom,20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add items")
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondartAccentColor: Color.accentColor)
                        .cornerRadius(12)
                        
                }).padding(.horizontal,animate ? 30: 50)
                    .shadow(
                        color:animate ? secondartAccentColor.opacity(0.7): Color.accentColor.opacity(0.7),
                        radius:animate ? 30 : 10,
                          x: 0,
                        y: animate ? 40: 20
                    )
                    .scaleEffect(animate ? 1.1 :1.0)
                    .offset(y: animate ? -7 :0 )
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
               
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation(){
        guard  !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation.easeInOut(duration: 2.5).repeatForever() ) {
                animate.toggle()
            }
        }  }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView().navigationTitle("Title")
        }
    }
}
