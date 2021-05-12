//
//  EditProfileView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/11/21.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @Binding var show: Bool
    @State var user: User
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
//    @ObservedObject var viewModel = UpdateUser()
    @EnvironmentObject var viewModel: AuthModel
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack {
            
                VStack {
                    Button(action: {showImagePicker.toggle()}, label: {
                        ZStack {
                            if let image = image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    //                                .cornerRadius(70)
                                    .frame(width: 140, height: 140)
                                    .padding(.top, 88)
                                    .padding(.bottom, 16)
                            } else {
                                KFImage(URL(string: self.user.profileImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .frame(width: 140, height: 140)
                    //                .padding(.top, 88)
                                    .padding(.bottom, 16)
                                    .shadow(color: .black, radius: 5)
                            }
                            
                        }
                        .padding(.top, 20)
                    }).sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedUIImage)
                    })
                
                VStack(spacing: 16) {
                    Text(user.email)
                        .font(.headline)
                    CustomTextField(text: $user.fullName, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))))
                    if (user.description != "") {
                        CustomTextField(text: $user.description, placeholder: Text("Description"), imageName: "person")
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))))
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    show.toggle()
                    guard let image = selectedUIImage else { return
                        viewModel.updateUserwithoutProfile(fullName: user.fullName, description: user.description)
                    }
                    viewModel.updateUser(fullName: user.fullName, description: user.description, profileImage: image)
                }, label: {
                    Text("Update Profile")
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))))
//                        .cornerRadius(25)
                        .padding(.top, 50)
                        .padding()
                })
                    Spacer()
                
                }
                
            
        }
//        .background(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
//        .ignoresSafeArea()
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
