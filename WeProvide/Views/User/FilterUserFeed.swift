//
//  FilterUserFeed.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/10/21.
//

import SwiftUI

struct FilterUserFeed: View {
    @State var selectedOption = "provider"
    var body: some View {
        VStack {
            FilterButtonView(selectedOption: $selectedOption)
            if(selectedOption == "provider") {
                ProviderListView()
            } else {
                QuoteFeedUserView()
            }
        }
        .padding(.top)
        
    }
}

struct FilterUserFeed_Previews: PreviewProvider {
    static var previews: some View {
        FilterUserFeed()
    }
}
