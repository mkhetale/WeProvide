//
//  QuoteFeedCellView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/8/21.
//

import SwiftUI

struct QuoteFeedCellView: View {
    @State var isShowingQuoteView = false
    @State var quote: QuoteModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Price Requested ($):")
                        Text(quote.price)
                            .font(.system(size:18, weight: .semibold))
                    }
                    
                    HStack {
                        Text("Description of the task:")
                        Text(quote.caption)
                            .lineLimit(nil)
                    }
                    HStack {
                        Button(action: {
                        }, label: {
                            Text("Update Quote")
                        })
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(.top)
                    }
                }
            }
            .padding()
           Divider()
        }
    }
}
