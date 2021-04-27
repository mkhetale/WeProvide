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
    //@Published var user: FirebaseAuth.User?
    @Published var userType = ""
//    @Published var userData = [User]()
    @Published var fullName = ""
    @Published var email = ""
    @Published var description = ""
    @Published var profileImageUrl = ""
    @Published var id = ""
    
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
//            let currentUser = self.userSession
            print("testing")
//            print(currentUser)
            //self.userData = currentUser as? User
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
            print("test \(data)")
            let user = User(dictionary: data)
            self.userType = user.type
            self.fullName = user.fullName
            self.description = user.description
            self.email = user.email
            self.id = user.id
            self.profileImageUrl = user.profileImageUrl
//            self.userData.append(user)
            print("DEBUG: User name \(user.type)")
//            print("DEBUG: User name \(String(describing: self.userData.first!.fullName))")
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
