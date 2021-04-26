//
//  Quote.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/8/21.
//

import SwiftUI

struct Quote: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading) {
                    Text("Bruce Wayne")
                        .font(.system(size:14, weight: .semibold))
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.")
                }
                .padding(.bottom)
                .padding(.trailing)
            }
            .padding(.horizontal)
            HStack {
//                Text("$$")
//                    .padding()
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Get a quote")
                })
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                .frame(width: 100, height: 20)
                .background(Color.white)
                .cornerRadius(25)
                .padding(.horizontal)
            }
           Divider()
        }
    }
}

struct Quote_Previews: PreviewProvider {
    static var previews: some View {
        Quote()
    }
}
