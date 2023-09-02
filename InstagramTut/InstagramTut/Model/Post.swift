//
//  Post.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 01/08/23.
//

import Foundation
import SwiftUI
import Firebase
struct Post: Identifiable, Hashable, Codable {
    var id: String = ""
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl : String
    let timestamp : Timestamp
    var user: User?

}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(ownerUid: UUID().uuidString, caption: "Caption 1", likes: 76, imageUrl: "wonderwoman", timestamp: Timestamp(), user: User.MOCKUSER[2]),
        .init(ownerUid: UUID().uuidString, caption: "Caption 2", likes: 100, imageUrl: "venom", timestamp: Timestamp(), user: User.MOCKUSER[1]),
        .init(ownerUid: UUID().uuidString, caption: "Caption 3", likes: 1006, imageUrl: "batman", timestamp: Timestamp(), user: User.MOCKUSER[0])
    ]
}
