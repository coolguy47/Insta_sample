//
//  SearchViewModel.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 26/08/23.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        Task {
            try await fetchAllUsers()
        }
    }

    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserServices.fetchAllUsers()
    }
}
