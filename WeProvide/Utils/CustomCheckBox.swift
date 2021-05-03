//
//  CustomCheckBox.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/15/21.
//

import SwiftUI
enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry

    var id: String { self.rawValue }
}

struct CustomCheckBox: View {
    @State var selectedFlavor = Flavor.chocolate

    @State var isChecked:Bool = false
    var title:String
    var count:Int = 0
    func toggle(){
        isChecked = !isChecked
    }
    var body: some View {
        VStack {
            HStack{
                Button(action: toggle) {
                    Image(systemName: isChecked ? "checkmark.square" : "square")
                }
                Text(title)
             
            }
            Picker("Flavor", selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            }
            Text("Selected flavor: \(selectedFlavor.rawValue)")
        }
    }
}

struct CustomCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CustomCheckBox(title:"title")
    }
}
