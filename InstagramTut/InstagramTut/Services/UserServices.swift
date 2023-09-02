//
//  UserServices.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 26/08/23.
//

import Foundation
import SwiftUI
import Firebase

class UserServices {

    static func fetchUser(withUid uid: String) async throws -> User {
        let snapShot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return  try snapShot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapShot = try await Firestore.firestore().collection("users").getDocuments()
        return snapShot.documents.compactMap{ try? $0.data(as: User.self) }
    }
}
