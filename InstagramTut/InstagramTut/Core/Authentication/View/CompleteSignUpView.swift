//
//  CompleteSignUpView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 01/08/23.
//

import SwiftUI

struct CompleteSignUpView: View {

    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Text("Welcome to instagram, \(viewModel.username)")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Click here to complete registeration and start using instagram")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top, 2)

          Button {
              Task {
                  try await viewModel.createUser()
              }
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 380, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            .padding(.top, 30)
            Spacer()

        }
        .padding(.vertical, 30)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }

        }
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
