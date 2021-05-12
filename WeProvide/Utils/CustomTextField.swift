//
//  CustomTextField.swift
//  WeProvide
//
//  Created by Mihir Khetale on 3/25/21.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white:1, alpha:0.87)))
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

