//
//  UserChatView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/5/21.
//

import SwiftUI

struct UserChatView: View {
    let user: User
    let viewModel: ChatViewModel
    @State var messageText: String = ""
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
   
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) { message in
                        MessageView(message: message)
                    }
                }
            }.padding(.top)
            
            UserMessageInputView(messageText: $messageText, action: sendMessage)
                .padding()
            
        }
    }
    
    func sendMessage() {
        viewModel.sendMessages(messageText)
        messageText = ""
    }
}

//struct UserChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserChatView()
//    }
//}
