//
//  ConversationsViewModel.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/6/21.
//

import SwiftUI
import Firebase

class ConversationsViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    private var recentMessageDictionary = [String: Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        query.order(by: "timestamp", descending: true)
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else { return}
            
            changes.forEach { change in
                let messageData = change.document.data()
                let uid = change.document.documentID
                
                COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.recentMessageDictionary[uid] = Message(user: user, dictionary: messageData)
                    self.recentMessages = Array(self.recentMessageDictionary.values)
                    
                    
                }
                COLLECTION_PROVIDERS.document(uid).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.recentMessageDictionary[uid] = Message(user: user, dictionary: messageData)
                    self.recentMessages = Array(self.recentMessageDictionary.values)
                    
                    
                }
                
            }
        }
        
    }
}
