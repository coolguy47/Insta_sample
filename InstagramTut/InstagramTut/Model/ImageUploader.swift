//
//  ImageUploader.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 28/08/23.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
struct ImageUploader {

    static func uploadImage(image: UIImage) async throws -> String? {
        guard let compressedImageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profileImages/\(filename)")
        do {
            let _ = try await ref.putDataAsync(compressedImageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Could upload image \(error.localizedDescription)")
            return nil
        }
    }

}
