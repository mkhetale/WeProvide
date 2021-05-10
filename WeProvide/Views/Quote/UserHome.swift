//
//  UserHome.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/7/21.
//

import SwiftUI

struct UserHome: View {
    var body: some View {
        NavigationView {
//                    FeedView()
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                ProviderSearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                ConversationView()
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
            }
//            .padding(.top,-100)
//            .padding(.bottom, 1)
//            .navigationBarTitle("Home")
//            .navigationBarTitleDisplayMode(.inline)
        }
//        .padding(.top, -50)
    }
}

struct UserHome_Previews: PreviewProvider {
    static var previews: some View {
        UserHome()
    }
}
