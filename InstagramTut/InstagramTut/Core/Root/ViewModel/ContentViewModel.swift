//
//  ContentViewModel.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 24/08/23.
//

import Foundation
import SwiftUI
import Firebase
import Combine

class ContentViewModel: ObservableObject {
    private let services = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?


    init() {
        setupSubscriber()
    }

    func setupSubscriber() {
        services.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)

        services.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }.store(in: &cancellables)

    }

}
