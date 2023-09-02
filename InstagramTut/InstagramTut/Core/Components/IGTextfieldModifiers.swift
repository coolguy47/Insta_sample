//
//  IGTextfieldModifiers.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 01/08/23.
//

import SwiftUI

struct IGTextfieldModifiers: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
