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
                            .font(.system(size:18, weight: .semibold))
                        Text(quote.price)
                            .font(.system(size:16))
                    }
                    
                    VStack {
                        Text("Description of the task:")
                            .font(.system(size:18, weight: .semibold))
                            .lineLimit(nil)
                        Text(quote.caption)
                            .font(.system(size:16))
                            .lineLimit(nil)
                    }
                    Divider()
                    if((quote.providerCaption) != "") {
                        VStack {
                            Text("Description requested by you:")
                                .font(.system(size:18, weight: .semibold))
                            Text(quote.providerCaption)
                                .font(.system(size:16))
                                .lineLimit(nil)
                        }
                    }
                    if((quote.providerPrice) != "") {
                        HStack {
                            Text("Price Requested by you:")
                                .font(.system(size:18, weight: .semibold))
                            Text(quote.providerPrice)
                                .font(.system(size:16))
                                .lineLimit(nil)
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            isShowingQuoteView.toggle()
                        }, label: {
                            Text("Update Quote")
                        })
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(.top)
                        .sheet(isPresented: $isShowingQuoteView, content: {
                            QuoteProviderView(show: $isShowingQuoteView, quote: $quote)
                        })
                    }
                }
            }
            .padding()
           Divider()
        }
    }
}
