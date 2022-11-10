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
    
    var body: some View {
        VStack{
            switch sessionManager.currentState {
            case .loggedIn:
                MainNavigation()
                    .transition(.opacity)
                    .environmentObject(sessionManager)
            case .loggedOut:
                SignUpView()
                    .transition(.opacity)
            default:
                // Splash Screen
                LoadingView()
            }
        }
        .onAppear{
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    sessionManager.currentState = .loggedIn
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
