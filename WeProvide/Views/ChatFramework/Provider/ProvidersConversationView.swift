//
//  ProvidersConversationView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/7/21.
//

import SwiftUI

struct ProvidersConversationView: View {
    @State var isShowingMessageView = false
    @State var showChat = false
    @State var user: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let user = user {
                NavigationLink(destination: UserChatView(user: user),
                               isActive: $showChat,
                               label: {} )
            }
            ScrollView {
                VStack {
                    ForEach(viewModel.recentMessages) { message in
                        NavigationLink(
                            destination: UserChatView(user: message.user),
                            label: {
                                ConversationCell(message: message)
                            })
                    }
                }
                .padding()
            }
        }
    }
}

struct ProvidersConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ProvidersConversationView()
    }
}
