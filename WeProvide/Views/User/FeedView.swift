//
//  FeedView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 3/31/21.
//

import SwiftUI

struct FeedView: View {
@EnvironmentObject var viewModel: AuthModel
    var body: some View {
        if viewModel.userType == "user" {
            VStack {
                UserProfile()
                ProviderListView()
                Spacer()
            }
        } else {
            VStack {
//                Text("test")
                UserProfile()
                QuoteFeedProviderView()
            }
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

