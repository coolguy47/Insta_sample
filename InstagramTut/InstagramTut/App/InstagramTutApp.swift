//
//  InstagramTutApp.swift
//  InstagramTut
//
//  Created by M_AMBIN05478 on 29/07/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main
struct InstagramTutApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  //  let user: User
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
