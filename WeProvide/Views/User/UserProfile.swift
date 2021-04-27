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
    var body: some View {
        VStack {
            KFImage(URL(string: self.viewModel.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 140, height: 140)
//                .padding(.top, 88)
                .padding(.bottom, 16)
                .shadow(color: .black, radius: 5)
            Text( self.viewModel.fullName)
                .font(.system(size:20, weight: .semibold))
            Text(self.viewModel.email)
                .font(.subheadline)
//            Spacer()
        }
        
        
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
