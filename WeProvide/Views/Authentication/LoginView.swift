//
//  LoginView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 3/25/21.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("WeProvide")
                .font(.system(size:40))
                .bold()
                .padding(.bottom, 30)
                .padding(.top, 88)
            VStack(spacing: 16) {
                CustomTextField(text: $email, placeholder: Text("Email"))
                    .padding()
                    .background(Color(.init(white:1, alpha:0.15)))
                    .cornerRadius(10)
                    .padding()
                    .foregroundColor(.white)
                CustomPasswordField(text: $email, placeholder: Text("Password"))
                    .padding()
                    .background(Color(.init(white:1, alpha:0.15)))
                    .cornerRadius(10)
                    .padding()
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            HStack {
                Spacer()
                Button(action: {}, label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 15)
                        .padding(.trailing, 30)
                })
            }
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 360, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding()
            })
            Spacer()
//            HStack {
//                Text("Don't have an account?")
//                    .font(.system(size:14))
//                Text("Signup")
//                    .font(.system(size:14, weight: .semibold))
//            }
//            padding()
//            padding(.bottom, 40)
            
        }
//        ZStack {
//            VStack {
//                CustomTextField(text: $email, placeholder: Text("Email"))
//                Image("hammer")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 100, height: 100)
//                Spacer()
//            }
//        }
//        .background(Color(.green))
//        ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().preferredColorScheme(.dark)
    }
}
