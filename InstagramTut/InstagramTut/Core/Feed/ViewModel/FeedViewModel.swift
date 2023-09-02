//
//  FeedViewModel.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 01/09/23.
//

import Foundation
import SwiftUI
import Firebase

class FeedViewModel: ObservableObject {

    @Published var posts = [Post]()

    init() {
        Task {
            try await fetchAllFeeds()
        }
    }
    

    @MainActor
    func fetchAllFeeds() async throws {
        self.posts = try await PostServices.fetchAllFeedPosts()
    }
}
