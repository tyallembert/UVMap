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
        VStack {
            switch sessionManager.currentState {
            case .loggedIn:
                withAnimation(.easeInOut(duration: 2.0)){
                    MainNavigation()
                        .transition(.opacity)
                        .environmentObject(sessionManager)
                }
            case .loggedOut:
                LoginView()
                    .transition(.opacity)
            case .signUp:
                SignUpView()
                    .transition(.opacity)
            default:
                // Splash Screen
                LoadingView()
                    .transition(
                        withAnimation(.easeInOut(duration: 2.0)){
                            .opacity
                        }
                    )
            }
        }
        .onAppear{
            Auth.auth().addStateDidChangeListener { auth, user in
                if let user = user {
                    databaseManager.getCurrentUser(email: user.email!, sessionManager: sessionManager)
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
