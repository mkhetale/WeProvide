//
//  SelectUserType.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/13/21.
//

import SwiftUI

struct SelectUserType: View {
    @State private var selection: String? = nil
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
//        NavigationView {
//            VStack {
//                TabView {
//                    SignupCustomer()
//                        .tabItem {
//                            Image(systemName: "person")
//                            Text("SignUp as Customer")
//                        }
//    //                Text("Feed")
//                    SignupProvider()
//                        .tabItem {
//                            Image(systemName: "hammer")
//                            Text("SignUp as Service Provider")
//                        }
//                        .padding(.horizontal)
//
//                }
//            }
//
//        }
//        NavigationView {
            ZStack{
                VStack {
                Text("Register as:")
                    .padding(.top, 88)
//                    .padding(.bottom, 88)
                    .foregroundColor(.white)
                    .font(.title)
//                Spacer()
                NavigationLink(
                    destination: SignupCustomer(),
                    tag: "Customer",
                    selection: $selection,
                    label: {})
                NavigationLink(
                    destination: SignupProvider(),
                    tag: "Provider",
                    selection: $selection,
                    label: {})
                Button(action: {
                    self.selection = "Customer"
                }, label: {
                    Text("Customer")
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        .frame(width: 360, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding()
                        .padding(.top, 150)
                })
                Button(action: {
                    self.selection = "Provider"
                }, label: {
                    Text("Service Provider")
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        .frame(width: 360, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding()
                })
                Spacer()
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))

                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                })

                }

            }
//            .navigationTitle("Register as:")
            .background(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            .ignoresSafeArea()
//        }
            
        }
    
}

struct SelectUserType_Previews: PreviewProvider {
    static var previews: some View {
        SelectUserType()
    }
}
