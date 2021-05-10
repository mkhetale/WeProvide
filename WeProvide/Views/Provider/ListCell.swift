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
    @State var showChat = false
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: UserChatView(user: provider),
                           isActive: $showChat,
                           label: {} )
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
                Button(action: { showChat.toggle()}, label: {
                    Text("Send Message")
                })
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .frame(width: 140, height: 30)
                .background(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                .cornerRadius(25)
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    isShowingQuoteView.toggle()
                }, label: {
                    Text("Get a quote")
                })
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .frame(width: 120, height: 30)
                .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                .cornerRadius(25)
                .padding(.horizontal)
                .sheet(isPresented: $isShowingQuoteView, content: {
                    QuoteView(show: $isShowingQuoteView, provider: $provider)
                })
            }
           Divider()
        }
        .padding(.bottom)
    }
}
