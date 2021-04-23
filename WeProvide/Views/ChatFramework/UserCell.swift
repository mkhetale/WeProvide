//
//  UserCell.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/22/21.
//

import SwiftUI

struct UserCell: View {
//    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            Image("batman")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Batman")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Bruce Wayne")
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
        }
    }
}


struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
