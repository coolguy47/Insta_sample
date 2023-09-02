//
//  UserProfileStats.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 29/07/23.
//

import SwiftUI

struct UserProfileStats: View {
    let count: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.headline)
            Text(title)
                .font(.subheadline)
        }
        .frame(width: 72)
    }
}

struct UserProfileStats_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileStats(count: 3, title: "Followers")
    }
}
