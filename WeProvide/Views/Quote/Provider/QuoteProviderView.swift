//
//  QuoteProviderView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/10/21.
//

import SwiftUI

struct QuoteProviderView: View {
    @State var providerCaption = ""
    @State var providerPrice = ""
    @Binding var show: Bool
    @Binding var quote: QuoteModel
    @ObservedObject var viewModel = UploadQuoteViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("Description By customer:")
                Text(quote.caption)
                    
            }
            .padding(.top,30)
            .padding(.horizontal)
            HStack {
                Text("Price requested By customer:")
                Text(quote.price)
                    
            }
            
            Text("Enter changes required for the task")
                .padding(.top,30)
            TextEditor(text: $quote.providerCaption)
                .foregroundColor(.black)
//                .padding(.top, 30)
                .frame(width: 350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            CustomText(text: $quote.providerPrice, placeholder: Text("Request amount change"), imageName: "dollarsign.circle")
                .padding()
//                .cornerRadius(10)
//                .padding()
                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))))
            Button(action: {
                viewModel.updateQuote(providerPrice: quote.providerPrice, providerCaption: quote.providerCaption, quote: quote, price: quote.price, caption: quote.caption)
                show.toggle()
            }, label: {
                Text("Update Quote")
            })
            Spacer()
        }
        .padding(.horizontal)
        
    }
}
