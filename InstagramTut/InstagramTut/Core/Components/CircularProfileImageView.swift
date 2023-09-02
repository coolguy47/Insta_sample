//
//  CircularProfileImageView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 28/08/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large

    var dimension : CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    var body: some View {
        if let imageUrl = user.profileImageUrl {
          KFImage(URL(string: imageUrl))
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .scaledToFill()
                .clipShape(Circle())
        } else {
            Image(systemName: "person")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(.white)
                .background(Color.gray)
                .clipShape(Circle())
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCKUSER[0], size: ProfileImageSize.large)
    }
}
