//
//  ContentView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @EnvironmentObject var databaseManager: DatabaseManager
    @EnvironmentObject var settingsManager: SettingsManager
    
    var body: some View {
        VStack{
            switch sessionManager.currentState {
            case .loggedIn:
                MainNavigation()
                    .transition(.opacity)
                    .environmentObject(sessionManager)
            case .loggedOut:
                LoginView()
                    .transition(.opacity)
            default:
                // Splash Screen
                Color.green.ignoresSafeArea()
            }
        }
        .onAppear{
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    sessionManager.currentState = .loggedIn
                    
                    if let testSettings = settingsManager.retrieveSettingsLocally(fileName:"settings"){// ?? settingsManager.init{
                        print("Settings Retrieved")
                        settingsManager.newSettings = testSettings
                    } else {
                        print("Settings not retrieved")
                    }
                } else {
                    sessionManager.currentState = .loggedOut
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
