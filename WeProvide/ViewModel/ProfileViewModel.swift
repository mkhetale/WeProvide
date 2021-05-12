//
//  ProfileViewModel.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/3/21.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
