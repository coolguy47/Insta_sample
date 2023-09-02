//
//  PostGridViewModel.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 01/09/23.
//

import Foundation

class PostGridViewModel: ObservableObject {

    private let user: User
    @Published var posts = [Post]()

    init(user: User) {
        self.user = user
        Task {
            try await getUserPost()
        }
    }

    func getUserPost() async throws {
        self.posts = try await PostServices.fetchUserPost(withUid: user.id)

        for i in 0 ..< self.posts.count {
            posts[i].user = self.user
        }
    }
}
