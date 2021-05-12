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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let user = user {
                NavigationLink(destination: UserChatView(user: user),
                               isActive: $showChat,
                               label: {} )
            }
            ScrollView {
                VStack {
                    if (viewModel.recentMessages.count != 0) {
                        ForEach(viewModel.recentMessages) { message in
                            NavigationLink(
                                destination: UserChatView(user: message.user),
                                label: {
                                    ConversationCell(message: message)
                                })
                        }
                    } else {
                        Text("No Recent Messages")
                            .font(.system(size:18, weight: .semibold))
                            .padding(.top)

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
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
