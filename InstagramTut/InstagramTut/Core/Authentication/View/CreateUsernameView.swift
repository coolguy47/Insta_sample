//
//  CreateUsernameView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 01/08/23.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack(spacing: 10) {
            Text("Create Username")
                .font(.title)
                .fontWeight(.bold)
            Text("Pick a username to your account, you can always change it later")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top, 2)
            TextField("Enter your username", text: $viewModel.username)
                .textInputAutocapitalization(.none)
                .modifier(IGTextfieldModifiers())
                .padding(.top)

            NavigationLink(destination: {
               PasswordView()
                    .navigationBarBackButtonHidden()
            }, label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 380, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            })
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

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
