//
//  EditProfileRowView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 26/08/23.
//

import SwiftUI

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var titleText: String
    var body: some View {
        HStack {
             Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            VStack {
                TextField(placeholder, text: $titleText)
                Divider()
            }
        }
        .frame(height: 32)
        .font(.subheadline)
    }
}

struct EditProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileRowView(title: "Name", placeholder: "Name", titleText: .constant(""))
    }
}
