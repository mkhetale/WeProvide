//
//  Quote.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/8/21.
//

import Firebase

struct QuoteModel: Identifiable {
    let id: String
    var caption: String
    let uid: String
    let pid: String
    var price: String
    var providerPrice: String
    var providerCaption: String

    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.pid = dictionary["pid"] as? String ?? ""
        self.price = dictionary["price"] as? String ?? ""
        self.providerPrice = dictionary["providerPrice"] as? String ?? ""
        self.providerCaption = dictionary["providerCaption"] as? String ?? ""
    }
}



