//
//  QuoteProviderView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/10/21.
//

import SwiftUI

struct QuoteProviderView: View {
    @State var caption = ""
    @State var price = ""
    @Binding var show: Bool
    @Binding var provider: User
    @ObservedObject var viewModel = UploadQuoteViewModel()
    var body: some View {
        VStack {
            Text("Enter Description of the task")
                .padding(.top,30)
            TextEditor(text: $caption)
                .foregroundColor(.black)
//                .padding(.top, 30)
                .frame(width: 350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            CustomTextField(text: $price, placeholder: Text("Request amount"), imageName: "dollarsign.circle")
                .padding()
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .cornerRadius(10)
                .padding()
                .foregroundColor(.white)
            Button(action: {
                viewModel.uploadQuote(caption: caption, pid: provider.id, price: price)
                show.toggle()
            }, label: {
                Text("Get a Quote")
            })
            Spacer()
        }
        
    }
}
