//
//  AuthService.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 24/08/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
class AuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    static let shared = AuthService()

    init() {
        Task {
            try await self.loadUserData()
        }
    }

    @MainActor
    func login(withEmail: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: withEmail, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("Username/ password is invalid")
        }

    }
    
    @MainActor
    func createUser(withEmail: String, username: String, password: String) async throws {

        do {
            let result = try await Auth.auth().createUser(withEmail: withEmail, password: password)
            self.userSession = result.user
            await uploadUserData(uuid: result.user.uid, username: username, email: withEmail)
        } catch {
            print("DEBUG: \\ Check what wrong with the data \(error.localizedDescription)")
        }
    }

    private func uploadUserData(uuid: String, username: String, email: String) async {
        let userData = User(id: uuid, username: username, email: email)
        self.currentUser = userData
        guard let encodeUser = try? Firestore.Encoder().encode(userData) else { return }
        try? await Firestore.firestore().collection("users").document(userData.id).setData(encodeUser)
    }

    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = self.userSession?.uid else { return }
        self.currentUser = try await UserServices.fetchUser(withUid: currentUid)
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil

    }
}
