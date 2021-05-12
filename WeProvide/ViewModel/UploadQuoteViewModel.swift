//
//  UploadQuote.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/8/21.
//

import SwiftUI
import Firebase

class UploadQuoteViewModel: ObservableObject {
    @EnvironmentObject var viewModel: AuthModel
    
    func uploadQuote(caption: String, pid: String, price: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let docRef = COLLECTION_QUOTE.document()
        let data: [String: Any] = ["uid": uid,
                                   "caption": caption,
                                   "pid": pid,
                                   "price": price,
                                   "id": docRef.documentID]
        docRef.setData(data) { _ in
            print("DEBUG: uploadquotefilter")
        }
    }
    func updateQuote(providerPrice: String, providerCaption: String, quote: QuoteModel, price: String, caption: String) {
        let docRef = COLLECTION_QUOTE.document(quote.id)
        docRef.updateData([
            "providerPrice": providerPrice,
            "providerCaption": providerCaption,
            "caption": caption,
            "price": price
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
    }
}
}
