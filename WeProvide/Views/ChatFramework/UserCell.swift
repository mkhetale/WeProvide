//
//  UserCell.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/22/21.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let provider: User
    
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: provider.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(provider.fullName)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(provider.description)
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
        }
    }
}



