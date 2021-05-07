//
//  ConversationView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/22/21.
//

import SwiftUI

struct ConversationView: View {
    @State var isShowingMessageView = false
    @State var showChat = false
    @State var user: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    //    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
//            NavigationLink(
//                destination: ChatView(),
//                isActive: $showChat,
//                label: {
//                    Text("")
//                })
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
            Button(action:{ isShowingMessageView.toggle() }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .sheet(isPresented: $isShowingMessageView, content: {
                NewMessageView(show: $isShowingMessageView, startChar: $showChat, user: $user)
            })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
