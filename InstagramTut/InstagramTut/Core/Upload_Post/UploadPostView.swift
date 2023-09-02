//
//  UploadPostView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 11/08/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @State private var photoItem: PhotosPickerItem?
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    var body: some View {
        VStack {
//Toolbar button
            HStack {
                Button {
                   clearDataAndReturnToHome()

                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                Spacer()
                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearDataAndReturnToHome()
                    }
                } label: {
                    Text("Upload")
                }
            }
            .padding(.horizontal)
//Image and caption
            HStack(spacing: 5) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                TextField("Enter your caption", text: $caption, axis: .vertical)

            }
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)

    }

    func clearDataAndReturnToHome() {
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        caption = ""
        tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
