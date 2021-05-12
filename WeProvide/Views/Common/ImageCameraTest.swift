//
//  ImageCameraTest.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/11/21.
//

import SwiftUI

struct ImageCameraTest: View {
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthModel
    
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
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                                .cornerRadius(70)
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
                })
                .actionSheet(isPresented: $showImagePicker) {
                    ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                        .default(Text("Photo Library")) {
                            ImagePicker(image: $selectedUIImage)
//                            self.sourceType = .photoLibrary
                        },
                        .default(Text("Camera")) {
                            self.showImagePicker = true
//                            self.sourceType = .camera
                        },
                        .cancel()
                    ])
//                .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
//                    ImagePicker(image: $selectedUIImage)
//                })
                }
                
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedUIImage)
            })
        }
        .background(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct ImageCameraTest_Previews: PreviewProvider {
    static var previews: some View {
        ImageCameraTest()
    }
}
