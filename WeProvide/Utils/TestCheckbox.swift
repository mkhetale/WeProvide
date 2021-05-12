//
//  TestCheckbox.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/15/21.
//

import SwiftUI

struct Ingredient{
    var id = UUID()
    var name: String
    var isSelected: Bool = false
}



struct TestCheckbox: View {
    @State var ingredients: [Ingredient] = [Ingredient(name: "Electrician"),
                                            Ingredient(name: "Plumber"),
                                            Ingredient(name: "Housekeeper")]
    
    
    
    var body: some View{
        VStack {
            List{
                ForEach(0..<ingredients.count){ index in
                    HStack {
                        Button(action: {
                            ingredients[index].isSelected = ingredients[index].isSelected ? false : true
                        }) {
                            HStack{
                                if ingredients[index].isSelected {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                        .animation(.easeIn)
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundColor(.primary)
                                        .animation(.easeOut)
                                }
                                Text(ingredients[index].name)
                            }
                        }.buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
        }
    }
}

struct testCart: View {
    func printData() {
        print("test")
    }
    
    var body: some View {
        VStack {
            Text("test")
            TestCheckbox()
            Button(action: printData, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

struct testCart_Previews: PreviewProvider {
    static var previews: some View {
        testCart()
    }
}
