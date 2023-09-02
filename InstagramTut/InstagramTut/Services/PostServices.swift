//
//  PostServices.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 01/09/23.
//

import Foundation
import Firebase
import SwiftUI

struct PostServices {
    private static let postCollections =  Firestore.firestore().collection("posts")
    static func fetchAllFeedPosts() async throws -> [Post] {
        let snapShot = try await postCollections.getDocuments()
        var posts = snapShot.documents.compactMap{ try? $0.data(as: Post.self) }
        for i in 0..<posts.count {
            let ownerId = posts[i].ownerUid
            let fetchUser = try await UserServices.fetchUser(withUid: ownerId)
            posts[i].user = fetchUser
        }

        return posts
    }

    static func fetchUserPost(withUid uid: String) async throws -> [Post] {
        let snapshot = try await postCollections.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return snapshot.documents.compactMap{ try? $0.data(as: Post.self) }
    }
}
