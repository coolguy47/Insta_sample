//
//  RegistrationViewModel.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 24/08/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var password: String = ""
    @Published var email: String = ""

    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, username: username, password: password)

        username = ""
        password = ""
        email = ""
    }
}
