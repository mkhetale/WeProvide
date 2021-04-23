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
    //    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(
                destination: ChatView(),
                isActive: $showChat,
                label: {
                    Text("")
                })
            ScrollView {
                VStack {
                    ForEach(0..<20) { _ in
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                ConversationCell()
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
                NewMessageView(show: $isShowingMessageView, startChar: $showChat)
            })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
