//
//  FeedProviderView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/23/21.
//

import SwiftUI

struct FeedProviderView: View {
    var body: some View {
        VStack {
            Text("Provdier")
            UserProfile()
            ProviderListView()
        }
    }
}

struct FeedProviderView_Previews: PreviewProvider {
    static var previews: some View {
        FeedProviderView()
    }
}
