//
//  FetchQuotesViewModel.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/8/21.
//

import SwiftUI
import Firebase

class FetchQuoutesViewModel: ObservableObject {
    @Published var quotes = [QuoteModel]()
    
    init() {
        fetchQuotes()
    }
    
    func fetchQuotes() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_QUOTE.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.quotes = documents.map({ QuoteModel(dictionary: $0.data() )})
            self.quotes = self.quotes.filter { $0.pid == uid}
        }
    }
}
