//
//  EditProfile.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/11/21.
//

import SwiftUI

struct EditProfile: View {
    @Binding var show: Bool
//    var user: User
    @ObservedObject var viewModel = FetchCurrentUser()
//    @ObservedObject var viewModel = ProfileViewModel(user: <#User#>)
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ForEach(viewModel.user) { item in
//            Text(viewModel.currentUser!.profileImageUrl)
            EditProfileView(show: $show, user: item)
        }
//        Text(viewModel.user[0].fullName)
    }
}

//struct EditProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfile()
//    }
//}
