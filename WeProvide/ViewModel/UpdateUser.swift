//
//  UpdateUser.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/11/21.
//

import SwiftUI
import Firebase

class UpdateUser: ObservableObject {
    @EnvironmentObject var viewModel: AuthModel
    
    func updateUser(fullName: String, description: String, profileImage: UIImage) {
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
                guard let uid = Auth.auth().currentUser?.uid else { return }
                let docRef = COLLECTION_USERS.document(uid)
                docRef.updateData([
                    "fullName": fullName,
                    "description": description,
                    "profileImageUrl": profileImageUrl
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
//                        self.viewModel.fetchUser()
                    }
                }
            }
        }
        
}
}

