//
//  ContentView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        switch sessionManager.currentState {
        case .loggedIn:
            MainNavigation()
                .transition(.opacity)
        case .loggedOut:
            LoginView()
                .transition(.opacity)
        default:
            // Splash Screen
            Color.green.ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
