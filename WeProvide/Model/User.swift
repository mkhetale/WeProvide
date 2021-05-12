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
    var fullName: String
    var email: String
    let type: String
    var description: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.type = dictionary["type"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
    }
}

