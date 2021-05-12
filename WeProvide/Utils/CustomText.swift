//
//  CustomText.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/10/21.
//

import SwiftUI

struct CustomText: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    .padding(.leading, 40)
            }
            HStack(spacing: 16) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                TextField("", text: $text )
                    .disableAutocorrection(true)
            }
        }
    }
}
