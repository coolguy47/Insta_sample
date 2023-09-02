//
//  SearchView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 31/07/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @StateObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(user: user, size: .xSmall)
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .font(.headline)
                                    Text(user.fullname ?? "")
                                }
                                .foregroundColor(Color.black)
                                Spacer()
                            }
                            .padding(.leading)

                        }
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search..")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
