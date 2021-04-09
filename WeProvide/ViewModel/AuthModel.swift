//
//  AuthModel.swift
//  WeProvide
//
//  Created by Mihir Khetale on 3/31/21.
//

import SwiftUI
import Firebase

class AuthModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login Error \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
            print("DEBUG: Successfully logged in")
//            print(self.userSession)
            self.fetchUser()
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
//        print("DEBUG\(uid)")
        Firestore.firestore().collection("users").document(uid).getDocument { result, error in
            if let error = error {
                print("Failed to fetch data \(error.localizedDescription)")
                return
            }
            guard let data = result?.data() else { return }
            let user = User(dictionary: data)
            print("DEBUG: User name \(user)")
        }
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
                        return
                    }
                    guard let user = result?.user else { return }
                    let data = ["email": email,
                                "fullName": fullName,
                                "profileImageUrl": profileImageUrl,
                                "id": user.uid
                    ]
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("DEBUG: Successfully uploaded user data")
                        self.userSession = user
                    }
                    
        //            print("DEBUG: User sign up successful")
                }
            }
        
            
        }
        
    }
}
