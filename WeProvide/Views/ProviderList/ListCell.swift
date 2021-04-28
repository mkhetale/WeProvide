//
//  ListCell.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/1/21.
//

import SwiftUI
import Kingfisher

struct ListCell: View {
    @State var isShowingQuoteView = false
    @State var provider: User
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                KFImage(URL(string: provider.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading) {
                    Text(provider.fullName)
                        .font(.system(size:14, weight: .semibold))
                    
                    Text(provider.description)
                }
                .padding(.bottom)
                .padding(.trailing)
            }
            HStack {
//                Text("$$")
//                    .padding()
                Spacer()
                Button(action: {
                    isShowingQuoteView.toggle()
                }, label: {
                    Text("Get a quote")
                })
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                .frame(width: 100, height: 20)
                .background(Color.white)
                .cornerRadius(25)
                .padding(.horizontal)
                .sheet(isPresented: $isShowingQuoteView, content: {
                    QuoteView(show: $isShowingQuoteView, provider: $provider)
                })
            }
           Divider()
        }
    }
}

//struct ListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCell()
//    }
//}
