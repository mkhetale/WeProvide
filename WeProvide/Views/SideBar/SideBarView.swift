//
//  SideBarView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/27/21.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        Home()
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}

struct Home: View {
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
    @State var show = false
    @State var selectedIndex = ""
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    HStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size: 22))
                                .foregroundColor(.black)
                        })
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        
                        Button(action: {
                            withAnimation(.spring()) {
                                show.toggle()
                            }
                        }, label: {
                            Image("batman")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 50, height: 50)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        })
                    }
                    Text("Home")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding()
//                .padding(.top, -80)
                .background(Color.white)
                .shadow(color: Color/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.1), radius: 5, x: 0, y: 5)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
//                UserProfile()
//                ProviderListView()
//                Text(selectedIndex)
//                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
            }
//            .padding(.top,-50)
            
            HStack(spacing: 0) {
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()) {
                                show.toggle()
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                            
                        })
                    }
                    .padding()
                    
                    HStack(spacing: 15) {
                        Image("batman")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        VStack(alignment: .leading, content: {
                            Text("Testing")
                                .font(.title)
                                .fontWeight(.semibold)
                            Text("test@testing.com")
                        })
                        .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    //Menu Buttons
                    VStack(alignment: .leading, spacing:5,  content: {
                        MenuButtons(image: "gear", title: "Setting", selected: $selectedIndex, show: $show)
                        MenuButtons(image: "gear", title: "Setting", selected: $selectedIndex, show: $show)
                        MenuButtons(image: "gear", title: "Setting", selected: $selectedIndex, show: $show)
                    })
                    .padding(.top)
                    .padding(.leading,100)
                    Spacer()
                }
                .frame(width: width - 100)
                .background(Color(.lightGray))
                .offset(x: show ? 0 : width-100)
            }
            .background(Color.black.opacity(show ? 0.3 : 0))
        }
        .padding(.top, -15)
//        .ignoresSafeArea(.keyboard)
    }
}

struct MenuButtons: View {
    var image: String
    var title: String
    @Binding var selected: String
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
                show.toggle()
            }
        }, label: {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.system(size: 22))
                    .frame(width: 25, height: 25)
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
            }
            .padding(.vertical)
            .padding(.trailing)
        })
        .padding(.top,5)
        .foregroundColor(.white)
    }
}
