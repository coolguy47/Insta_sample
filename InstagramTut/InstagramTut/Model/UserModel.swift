//
//  UserModel.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 01/08/23.
//

import Foundation
import Firebase

struct User : Identifiable, Codable, Hashable {
    var id: String
    var username: String
    var email: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var isCurrentUser: Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        return uid == id ? true : false
    }
}

extension User {
    static let MOCKUSER: [User] = [
        .init(id: UUID().uuidString, username: "Batman", email: "batman@gmail.com", profileImageUrl: nil, fullname: "Bruce wayne", bio: "Gotham's Dark Night"),
        .init(id: UUID().uuidString, username: "Venom", email: "venom@gmail.com", profileImageUrl: nil, fullname: "Eddie Brock", bio: "Venom"),
        .init(id: UUID().uuidString, username: "wonderwoman", email: "wonderwoman@gmail.com", profileImageUrl: nil, fullname: "Gal Gaddot", bio: "Wonder Woman")
    ]
}
