//
//  ContentView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 29/07/23.
//

import SwiftUI
import Firebase
struct ContentView: View {
   // let user: User
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        if viewModel.userSession == nil {
            LoginView()
                .environmentObject(registrationViewModel)
        } else if let currentUser = viewModel.currentUser {
            TabBarView(user: currentUser)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       // ContentView(user: User.MOCKUSER[0])
        ContentView()
    }
}
