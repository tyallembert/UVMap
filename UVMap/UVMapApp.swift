//
//  UVMapApp.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI

@main
struct UVMapApp: App {
    
    @StateObject private var sessionManager = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sessionManager)
        }
    }
}
