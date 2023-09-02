//
//  ProfileHeaderView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 10/08/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile: Bool = false
    var body: some View {

        VStack(spacing: 10) {
            HStack {
                //Profile Pic with Description
                VStack {
                    CircularProfileImageView(user: user, size: .large)
                    if let fullname = user.fullname {
                        Text(fullname)
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    if let bio = user.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                    Text(user.username)
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                //Profile Stats
                HStack {
                    UserProfileStats(count: 3, title: "Posts")
                    UserProfileStats(count: 3, title: "Followers")
                    UserProfileStats(count: 3, title: "Following")

                }

            }
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? Color.gray : .clear, lineWidth: 1)
                    }

            }

        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCKUSER[0])
    }
}
