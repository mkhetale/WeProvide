//
//  ChatViewModel.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/3/21.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
    @EnvironmentObject var viewModel: AuthModel
    let user: User
    @Published var messages = [Message]()
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    func fetchMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_MESSAGES.document(uid).collection(user.id).order(by: "timestamp", descending: false).addSnapshotListener { (querysnapshot, error ) in
            guard let snapshot = querysnapshot else { return}
            snapshot.documentChanges.forEach { (documentChange) in
                
                let dict = documentChange.document.data()
                let message = Message(user: self.user, dictionary: dict)
                self.messages.append(message)
             
            }
        }
    }
    
    func sendMessages(_ messageText: String) {
//        guard let currentUid = viewModel.userSession?.uid else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let receivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
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
