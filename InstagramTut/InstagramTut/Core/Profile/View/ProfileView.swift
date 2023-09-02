//
//  ProfileView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 29/07/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User

    private let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]

    private let colors: [Color] = [.yellow, .red, .purple, .green, .black, .blue, .orange, .pink, .gray]

    var body: some View {
      //  NavigationStack {
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

                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
   // }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCKUSER[0])
    }
}

