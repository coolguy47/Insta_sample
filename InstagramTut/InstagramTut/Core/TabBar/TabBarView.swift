//
//  TabBarView.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 29/07/23.
//

import SwiftUI

struct TabBarView: View {
    let user: User
    @State private var selectedIndex = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
           SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            Text("Notifications")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            CurrentUserProfileView(user: user)
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .tint(.black)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        //TabBarView(user: User.MOCKUSER[0])
        TabBarView(user: User.MOCKUSER[0])
    }
}
