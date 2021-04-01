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
    @EnvironmentObject var viewModel: AuthModel
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                Image("hammer")
    //                .font(.system(size:40))
    //                .bold()
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                    .padding(.bottom, 30)
                    .padding(.top, 88)
                VStack(spacing: 16) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white:1, alpha:0.15)))
                        .cornerRadius(10)
                        .padding()
                        .foregroundColor(.white)
                    CustomPasswordField(text: $password, placeholder: Text("Password"))
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
                
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        .frame(width: 360, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding()
                })
                Spacer()
                
                NavigationLink(
                    destination: SignupCustomer().navigationBarBackButtonHidden(true),
                    label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size:14))
                            Text("Signup")
                                .font(.system(size:14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding()
                    })
                
                
                }
                
            }
            .background(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().preferredColorScheme(.dark)
    }
}
