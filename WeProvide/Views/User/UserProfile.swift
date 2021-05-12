//
//  UserProfile.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/1/21.
//

import SwiftUI
import Kingfisher

struct UserProfile: View {
@EnvironmentObject var viewModel: AuthModel
@State var showEditProfile = false
    var body: some View {
        VStack {
            Button(action: {showEditProfile.toggle()}, label: {
                KFImage(URL(string: self.viewModel.currentUser?.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 140, height: 140)
    //                .padding(.top, 88)
                    .padding(.bottom, 16)
                    .shadow(color: .black, radius: 5)
            })
            .sheet(isPresented: $showEditProfile, content: {
                EditProfileView(show: $showEditProfile, user: (viewModel.currentUser)!)
            })
            
            Text( self.viewModel.currentUser?.fullName ?? "")
                .font(.system(size:20, weight: .semibold))
            Text(self.viewModel.currentUser?.email ?? "")
                .font(.subheadline)
//            Spacer()
        }
        .padding(.top,20)
        
        
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
