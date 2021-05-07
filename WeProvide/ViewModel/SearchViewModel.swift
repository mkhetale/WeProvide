//
//  SearchViewModel.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/26/21.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var providers = [User]()
    
    init() {
        fetchProviders()
    }
    
    func fetchProviders() {
        COLLECTION_PROVIDERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.providers = documents.map({ User(dictionary: $0.data()) })
            
        }
    }
    
    func filteredProviders(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return providers.filter({ $0.description.lowercased().contains(lowercasedQuery) || $0.email.contains(lowercasedQuery)})
    }
}
