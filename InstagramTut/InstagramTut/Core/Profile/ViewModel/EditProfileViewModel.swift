//
//  EditProfileViewModel.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 26/08/23.
//

import Foundation
import Foundation
import PhotosUI
import SwiftUI
import Firebase
@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await  loadImage(fromItem: selectedImage) }
        }
    }
    @Published var fullname: String = ""
    @Published var bioText: String = ""
    @Published var profileImage: Image?
    var uiImage: UIImage?

    init(user: User) {
        self.user = user
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        if let bio = user.bio {
            self.bioText = bio
        }
    }

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let image = UIImage(data: data) else {return }
        self.uiImage = image
        self.profileImage = Image(uiImage: image)
    }

    func updateUserData() async throws {

        var data = [String: Any]()
        if let uiimage = uiImage {
           let uploadedImage = try? await ImageUploader.uploadImage(image: uiimage)
            data["profileImageUrl"] = uploadedImage

        }
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        if !bioText.isEmpty && user.bio != bioText {
            data["bio"] = bioText
        }
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
