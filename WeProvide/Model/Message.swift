//
//  Message.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/22/21.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "batman", messageText: "Message1", isCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "Message2", isCurrentUser: true),
    .init(id: 2, imageName: "batman", messageText: "Message3", isCurrentUser: false),
    .init(id: 3, imageName: "batman", messageText: "Message4", isCurrentUser: true),
    .init(id: 4, imageName: "batman", messageText: "Message5", isCurrentUser: false)
]
