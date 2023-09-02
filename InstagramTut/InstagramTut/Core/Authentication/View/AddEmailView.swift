//
//  AddEmailView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 01/08/23.
//

import SwiftUI

struct AddEmailView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 10) {
            Text("Add your email")
                .font(.title)
                .fontWeight(.bold)
            Text("You will use this email to sign in to your account")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top, 2)
            TextField("Enter your email", text: $viewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(IGTextfieldModifiers())
                .padding(.top)

            NavigationLink(destination: {
                CreateUsernameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
