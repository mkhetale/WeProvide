//
//  QuoteView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/27/21.
//

import SwiftUI
import Kingfisher

struct QuoteView: View {
    @State var caption = ""
    @State var price = ""
    @Binding var show: Bool
    @Binding var provider: User
    @ObservedObject var viewModel = UploadQuoteViewModel()
    var body: some View {
        VStack {
            KFImage(URL(string: provider.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 140, height: 140)
//                .padding(.top, 88)
                .padding(.bottom, 16)
                .shadow(color: .black, radius: 5)
                .padding(.top,20)
            Text( provider.fullName)
                .font(.system(size:20, weight: .semibold))
            Text(provider.email)
                .font(.subheadline)
            Text(provider.description)
                .font(.subheadline)
            Text("Enter Description of the task")
                .padding(.top,30)
            TextEditor(text: $caption)
                .foregroundColor(.black)
//                .padding(.top, 30)
                .frame(width: 350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            CustomText(text: $price, placeholder: Text("Request amount"), imageName: "dollarsign.circle")
                .padding()
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .cornerRadius(10)
//                .padding()
                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))))
            Button(action: {
                viewModel.uploadQuote(caption: caption, pid: provider.id, price: price)
                show.toggle()
            }, label: {
                Text("Get a Quote")
            })
            Spacer()
        }
        .padding(.horizontal)
    }
}
