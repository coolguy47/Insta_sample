//
//  EditProfileView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 26/08/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel

    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Button("Done") {
                    Task {
                        try await viewModel.updateUserData()
                        dismiss()
                    }
                }
            }
            .padding()
            Divider()
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                         image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .large)
                    }
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical, 8)
            
            EditProfileRowView(title: "Name", placeholder: "Enter you name..", titleText: $viewModel.fullname)
            EditProfileRowView(title: "Bio", placeholder: "Enter your Bio..", titleText: $viewModel.bioText)
            Spacer()
        }

    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCKUSER[0])
    }
}
