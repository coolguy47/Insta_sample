//
//  FeedView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 30/07/23.
//

import SwiftUI

struct FeedView: View {
  @StateObject var viewModel = FeedViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {

                    } label: {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
