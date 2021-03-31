//
//  SignupCustomer.swift
//  WeProvide
//
//  Created by Mihir Khetale on 3/25/21.
//

import SwiftUI

struct SignupCustomer: View {
    @State var email = ""
    @State var password = ""
    @State var fullName = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack{
            VStack {
                Button(action: {showImagePicker.toggle()}, label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .cornerRadius(70)
                                .frame(width: 140, height: 140)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                        } else {
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                                .foregroundColor(.white)
                        }
                        
                    }
                }).sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage)
                })
            
            VStack(spacing: 16) {
                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white:1, alpha:0.15)))
                    .cornerRadius(10)
//                    .padding()
                    .foregroundColor(.white)
                CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                    .padding()
                    .background(Color(.init(white:1, alpha:0.15)))
                    .cornerRadius(10)
//                    .padding()
                    .foregroundColor(.white)
                CustomPasswordField(text: $email, placeholder: Text("Password"))
                    .padding()
                    .background(Color(.init(white:1, alpha:0.15)))
                    .cornerRadius(10)
//                    .padding()
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
                Text("Sign Up")
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
        .background(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct SignupCustomer_Previews: PreviewProvider {
    static var previews: some View {
        SignupCustomer()
    }
}
