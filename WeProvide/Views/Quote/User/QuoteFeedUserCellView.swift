//
//  QuoteFeedUserCellView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/10/21.
//

import SwiftUI

struct QuoteFeedUserCellView: View {
    @State var editDescription = false
    @State var editPrice = false
    @State var quote: QuoteModel
    @ObservedObject var viewModel = UploadQuoteViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading) {
                    if((quote.providerCaption) != "") {
                        VStack {
                            Text("Description requested by provider:")
                                .lineLimit(3)
                                .font(.system(size:16, weight: .semibold))
                            Text(quote.providerCaption)
                                .font(.system(size:14))
                                .lineLimit(3)
                        }
                    }
                    if((quote.providerPrice) != "") {
                        HStack {
                            Text("Price Requested by provider($):")
                                .lineLimit(3)
                                .font(.system(size:16, weight: .semibold))
                            Text(quote.providerPrice)
                                .lineLimit(3)
                                .font(.system(size:14))
                        }
                        Divider()
                    }
                    if(editDescription) {
                        Text("Enter Description of the task")
                            .font(.system(size:16, weight: .semibold))
    //                        .padding(.top,30)
                        TextEditor(text: $quote.caption)
                            .foregroundColor(.black)
            //                .padding(.top, 30)
                            .frame(width: 350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    } else {
                        VStack {
                            Text("Description of the task:")
                                .lineLimit(3)
                                .font(.system(size:16, weight: .semibold))
                            Text(quote.caption)
                                .lineLimit(3)
                                .font(.system(size:14))
                        }
                        HStack {
                            Spacer()
                            Button(action:{ editDescription.toggle() }, label: {
                                HStack {
                                    Image(systemName: "pencil.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                    Text("Edit Description")
                                        .font(.system(size:16, weight: .semibold))
                                }
//                                    .padding()
                            })
                        }


                    }
                    
                    if(editPrice) {
                        CustomText(text: $quote.price, placeholder: Text("Request amount"), imageName: "dollarsign.circle")
                            .padding()
//                            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
//                            .cornerRadius(10)
                            .padding(.horizontal)
                            .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))))
                    } else {
                        HStack {
                            Text("Price Requested ($):")
                                .lineLimit(3)
                                .font(.system(size:16, weight: .semibold))
                            Text(quote.price)
                                .font(.system(size:14))
                                .lineLimit(3)
                        }
                        HStack {
                            Spacer()
                            Button(action:{ editPrice.toggle() }, label: {
                                HStack {
                                    Image(systemName: "pencil.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                    Text("Edit Price")
                                        .font(.system(size:16, weight: .semibold))
                                }
//                                    .padding()
                            })
                        }
                    }
                    if(editPrice || editDescription) {
                        Button(action: {
                            viewModel.updateQuote(providerPrice: quote.providerPrice, providerCaption: quote.providerCaption, quote: quote, price: quote.price, caption: quote.caption)
                            editPrice.toggle()
                            editDescription.toggle()
                        }, label: {
                            Text("Update Quote")
                                .font(.system(size:16, weight: .semibold))
                        })
                    }
                    
                    
                }
            }
            .padding()
           Divider()
        }
    }

}

//struct QuoteFeedUserCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuoteFeedUserCellView()
//    }
//}
