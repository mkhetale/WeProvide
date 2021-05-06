//
//  ChatViewModel.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/3/21.
//

import SwiftUI
import Firebase

struct ChatViewModel {
    @EnvironmentObject var viewModel: AuthModel
    let user: User
    
    init(user: User) {
        self.user = user
    }
    func fetchMessages() {
        
    }
    
    func sendMessages(_ messageText: String) {
//        guard let currentUid = viewModel.userSession?.uid else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let receivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messagse")
        let messageId = currentUserRef.documentID
        let data: [String: Any] = ["text": messageText,
                    "id": messageId,
                    "fromId": currentUid,
                    "toId": user.id,
                    "timestamp": Timestamp(date: Date())]
        currentUserRef.setData(data)
        receivingUserRef.document(messageId).setData(data)
        receivingRecentRef.document(currentUid).setData(data)
        currentRecentRef.document(user.id).setData(data)
    }
}
