//
//  UserChatView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/5/21.
//

import SwiftUI

struct UserChatView: View {
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    @State var messageText: String = ""
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
   
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    if(viewModel.messages.count != 0) {
                        ForEach(viewModel.messages) { message in
                            MessageView(message: message)
                        }
                    } else {
                        Text("Start a conversation")
                            .font(.system(size:18, weight: .semibold))
                            .padding(.top)
                    }
                    
                }
            }.padding(.top)
            
            UserMessageInputView(messageText: $messageText, action: sendMessage)
                .padding()
        }.navigationTitle(user.fullName)
    }
    
    func sendMessage() {
        viewModel.sendMessages(messageText)
        messageText = ""
    }
}
