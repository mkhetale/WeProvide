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
    @Published var userType = ""
    @Published var fullName = ""
    @Published var email = ""
    @Published var description = ""
    @Published var profileImageUrl = ""
    @Published var id = ""
//    @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
        fetchProvider()
    }
    
    func login(withEmail email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login Error \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
            print("DEBUG: Successfully logged in")
            self.fetchUser()
            self.fetchProvider()
        }
    }
    
    func signOut() {
        userSession = nil
        userType = ""
        fullName = ""
        email = ""
        description = ""
        profileImageUrl = ""
        id = ""
        try? Auth.auth().signOut()
    }
    
    func fetchProvider() {
        guard let uid = userSession?.uid else { return }
        Firestore.firestore().collection("providers").document(uid).getDocument { result, error in
            if let error = error {
//                self.fetchProvider()
                print("Failed to fetch data \(error.localizedDescription)")
                return
            }
            guard let data = result?.data() else { return }
            let user = User(dictionary: data)
//            self.user = User(dictionary: data)
            self.userType = user.type
            self.fullName = user.fullName
            self.description = user.description
            self.email = user.email
            self.id = user.id
            self.profileImageUrl = user.profileImageUrl
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { result, error in
            if let error = error {
//                self.fetchProvider()
                print("Failed to fetch data \(error.localizedDescription)")
                return
            }
            guard let data = result?.data() else { return }
            let user = User(dictionary: data)
//            self.user = User(dictionary: data)
            self.userType = user.type
            self.fullName = user.fullName
            self.description = user.description
            self.email = user.email
            self.id = user.id
            self.profileImageUrl = user.profileImageUrl
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
                                "type": "user",
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
    func registerProvider(email: String, password: String, fullName: String, profileImage: UIImage, description: String) {
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
                                "type": "provider",
                                "description": description,
                                "id": user.uid
                    ]
                    Firestore.firestore().collection("providers").document(user.uid).setData(data) { _ in
                        print("DEBUG: Successfully uploaded user data")
                        self.userSession = user
                    }
                    
        //            print("DEBUG: User sign up successful")
                }
            }
        
            
        }
        
    }
}
