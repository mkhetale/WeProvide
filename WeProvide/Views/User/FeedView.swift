//
//  FeedView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 3/31/21.
//

import SwiftUI

struct FeedView: View {

    var body: some View {
        VStack {
            Text("User")
            UserProfile()
            ProviderListView()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

