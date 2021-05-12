//
//  FetchCurrentUser.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/11/21.
//

import SwiftUI
import Firebase

class FetchCurrentUser: ObservableObject {
    @Published var user =  [User]()
    @Published var currentUser: User?
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.user = documents.map({ User(dictionary: $0.data() )})
            self.user = self.user.filter { $0.id == uid}
            self.currentUser = self.user[0]
            print(self.currentUser)
            print("test")
        }
    }
}
