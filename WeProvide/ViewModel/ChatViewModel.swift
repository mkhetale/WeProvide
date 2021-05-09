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
//        print(viewModel.userType)
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let query = COLLECTION_MESSAGES.document(uid).collection(user.id)
        query.order(by: "timestamp", descending: true)
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added}) else { return}
            changes.forEach { change in
                let messageData = change.document.data()
                guard let fromId = messageData["fromId"] as? String else { return }
                
                COLLECTION_USERS.document(fromId).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictionary: messageData))
                    
                }
                COLLECTION_PROVIDERS.document(fromId).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictionary: messageData))
                    
                }
                print("test1")
                print(self.messages)
//                self.messages = self.messages.sorted(by: { $0.timestamp < $1.timestamp})
//                self.messages.sorted(by: { $0.timestamp > $1.timestamp })
                self.messages = self.messages.sorted(by: { $0.timestamp.compare($1.timestamp) == .orderedDescending})
                print("test2")
                print(self.messages)
//                self.recentMessages.order(by: "timestamp", descending: true)
                
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
