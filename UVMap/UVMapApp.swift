//
//  UVMapApp.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI
import Firebase

@main
struct UVMapApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    @StateObject private var sessionManager = SessionManager()
    @StateObject private var databaseManager = DatabaseManager()
    @StateObject private var settingsManager = SettingsManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sessionManager)
                .environmentObject(databaseManager)
//                .environmentObject(settingsManager)
        }
    }
}
