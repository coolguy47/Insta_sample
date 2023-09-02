//
//  FeedCell.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 30/07/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post : Post
    var body: some View {
        VStack {
            // image + username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xSmall)
                }
                if let fullName = post.user?.fullname {
                    Text(fullName)
                        .font(.headline)
                }
                Spacer()
            }
            .padding(.leading, 8)
            //post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .frame(height: 400)
                .scaledToFill()
                .clipShape(Rectangle())
            //like , share , comment button
            HStack {
                Button {
                    print("Like button")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button {
                    print("Comment on post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button {
                    print("Share the post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)

            //caption label
            HStack {
                Text("\(post.user?.username ?? "") " )
                    .font(.footnote)
                    .fontWeight(.semibold)
+
                Text(post.caption)
                    .font(.footnote)
                    .fontWeight(.medium)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            .padding(.top, 1)
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.top, 1)
                .foregroundColor(.gray)

        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}
