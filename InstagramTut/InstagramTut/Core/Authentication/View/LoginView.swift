//
//  LoginView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 31/07/23.
//

import SwiftUI

struct LoginView: View {
   @StateObject var loginModel = LoginViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Image("instagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 250)

                VStack(spacing: 20) {
                    TextField("Enter your email", text: $loginModel.email)
                        .textInputAutocapitalization(.none)
                        .modifier(IGTextfieldModifiers())
                    SecureField("Enter your Password", text: $loginModel.password)
                        .textInputAutocapitalization(.none)
                        .modifier(IGTextfieldModifiers())
                }
                Button {
                    print("Forgot button clicked")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                Button {
                    Task {
                       try await loginModel.login()
                    }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 380, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.vertical)

                HStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                Text("Connect with facebook")
                    .foregroundColor(Color(.systemBlue))
                    .padding(.top, 8)
                Spacer()
                Divider()

                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("Dont have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color(.systemBlue))
                }
                .padding(.vertical, 16)

            }
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
