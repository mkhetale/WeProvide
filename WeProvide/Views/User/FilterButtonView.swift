//
//  FilterButtonView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/10/21.
//

import SwiftUI

struct FilterButtonView: View {
    @Binding var selectedOption: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    self.selectedOption = "provider"
                }, label: {
                    Text("Service Providers")
                })
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .frame(width: 160, height: 40)
                .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                .cornerRadius(25)
//                .padding(.horizontal)
                Button(action: {
                    self.selectedOption = "quote"
                }, label: {
                    Text("Quotes")
                })
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .frame(width: 160, height: 40)
                .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                .cornerRadius(25)
//                .padding(.horizontal)
            }
        }
    }
}

