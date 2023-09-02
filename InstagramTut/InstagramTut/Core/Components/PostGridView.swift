//
//  PostGridView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 10/08/23.
//

import SwiftUI
import Kingfisher
struct PostGridView: View {
    private let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    let user: User
    @StateObject var viewModel: PostGridViewModel

    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }

    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1

    var body: some View {
        LazyVGrid(columns: gridItems,spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()

            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(user: User.MOCKUSER[0])
    }
}
