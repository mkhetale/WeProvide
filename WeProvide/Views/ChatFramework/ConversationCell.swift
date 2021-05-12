//
//  ConversationCell.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/22/21.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    let message: Message
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
//                Image("batman")
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading) {
                    Text(message.user.fullName)
                        .font(.system(size:14, weight: .semibold))
                    
                    Text(message.text)
                }
//                .padding(.bottom)
                .foregroundColor(.black)
                .padding(.trailing)
            }
           Divider()
        }
    }
}

