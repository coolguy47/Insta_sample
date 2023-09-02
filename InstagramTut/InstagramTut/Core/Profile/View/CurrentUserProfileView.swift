//
//  CurrentUserProfileView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 10/08/23.
//

import Foundation
import SwiftUI
struct CurrentUserProfileView : View {
    let user: User
    private let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)
                Divider()
                PostGridView(user: user)
            }

            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                          AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}


