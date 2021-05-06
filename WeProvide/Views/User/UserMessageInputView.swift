//
//  UserMessageInputView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/5/21.
//

import SwiftUI

struct UserMessageInputView: View {
    @Binding var messageText: String
//    @EnvironmentObject var viewModel: ChatViewModel
//    @StateObject var viewModel: ChatViewModel = Chat
//    @ObservedObject var viewModel: ChatViewModel
    var action: () -> Void
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            HStack {
                TextField("Message...", text: $messageText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
        }
    }
}

//struct UserMessageInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserMessageInputView()
//    }
//}
