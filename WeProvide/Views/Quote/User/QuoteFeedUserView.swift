//
//  QuoteFeedUserView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/10/21.
//

import SwiftUI

struct QuoteFeedUserView: View {
    @ObservedObject var viewObj = FetchQuoutesViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    Text("List of Quotes")
                        .font(.system(size:22, weight: .semibold))
                    ForEach(viewObj.userQuotes) { quote in
                        QuoteFeedUserCellView(quote: quote)
                    }
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
                .padding()
            }
            
        }
    }
}

struct QuoteFeedUserView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteFeedUserView()
    }
}
