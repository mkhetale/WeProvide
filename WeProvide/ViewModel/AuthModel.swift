//
//  AuthModel.swift
//  WeProvide
//
//  Created by Mihir Khetale on 3/31/21.
//

import SwiftUI
import Firebase

class AuthModel: ObservableObject {
    func login() {
        
    }
    
    func registerUser(email: String, password: String, fullName: String, profileImage: UIImage) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
            }
            print("DEBUG: User sign up successful")
        }
    }
}
