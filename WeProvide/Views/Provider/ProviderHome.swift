//
//  ProviderHome.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/7/21.
//

import SwiftUI

struct ProviderHome: View {
    var body: some View {
        NavigationView {
//                    FeedView()
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                ProvidersConversationView()
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
//            .offset(y: 50)
//            .padding(.top,-100)
//            .padding(.bottom, 1)
//            .navigationBarTitle("Home")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProviderHome_Previews: PreviewProvider {
    static var previews: some View {
        ProviderHome()
    }
}
