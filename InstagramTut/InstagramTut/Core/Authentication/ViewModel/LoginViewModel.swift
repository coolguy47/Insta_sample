//
//  LoginViewModel.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 24/08/23.
//

import Foundation
class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""

    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
