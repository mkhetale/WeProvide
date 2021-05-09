//
//  QuoteFeedProviderView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/8/21.
//

import SwiftUI

struct QuoteFeedProviderView: View {
    //    @EnvironmentObject var viewModel: AuthModel
    @ObservedObject var viewObj = FetchQuoutesViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    Text("List of Quotes")
                        .font(.system(size:22, weight: .semibold))
                    ForEach(viewObj.quotes) { quote in
                        QuoteFeedCellView(quote: quote)
                    }
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
                .padding()
            }        }
    }
}

struct QuoteFeedProviderView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteFeedProviderView()
    }
}
