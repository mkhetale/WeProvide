//
//  MessageInputView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/22/21.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    
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
                
                Button(action: {}) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: .constant("Message.."))
    }
}
