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
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Failed to Upload Image \(error.localizedDescription)")
                return
            }
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                    }
                    guard let user = result?.user else { return }
                    let data = ["email": email,
                                "fullName": fullName,
                                "profileImageUrl": profileImageUrl,
                                "userId": user.uid
                    ]
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("DEBUG: Successfully uploaded user data")
                        
                    }
                    
        //            print("DEBUG: User sign up successful")
                }
            }
        
            
        }
        
    }
}
