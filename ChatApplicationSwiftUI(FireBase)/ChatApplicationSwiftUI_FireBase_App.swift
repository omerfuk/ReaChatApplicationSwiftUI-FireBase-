//
//  ChatApplicationSwiftUI_FireBase_App.swift
//  ChatApplicationSwiftUI(FireBase)
//
//  Created by Ömer Faruk Kılıçaslan on 10.05.2022.
//

import SwiftUI
import Firebase

@main
struct ChatApplicationSwiftUI_FireBase_App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
