//
//  UserProfile.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/1/21.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        VStack {
            Image("batman")
                .resizable()
                .scaledToFill()
                .clipped()
                .cornerRadius(70)
                .frame(width: 140, height: 140)
//                .padding(.top, 88)
                .padding(.bottom, 16)
                .shadow(color: .black, radius: 5)
            Text("Full name")
                .font(.system(size:20, weight: .semibold))
            Text("test@test.com")
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
