//
//  User.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/1/21.
//

import Firebase

struct User: Identifiable {
    let id: String
    let profileImageUrl: String
    let fullName: String
    let email: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
    }
}

