//
//  LoginButton.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI

// the view of the log in button for the log in page
struct LoginButton: View {
    @EnvironmentObject var sessionManager: SessionManager
    @EnvironmentObject var databaseManager: DatabaseManager
    
    var icon: String = "checkmark.circle.fill"
    
    var body: some View {
        Button {
            sessionManager.currentState = .loading
            sessionManager.signIn(database: databaseManager)
            
        } label: {
            Label("Sign in", systemImage: icon)
        }
        .font(.title2)
        .padding(20)
        .frame(width: 170, height: 60)
        .foregroundColor(Color.white)
        .background(Color.uvmGreen)
        .border(Color.uvmGreen, width: 5)
        .clipShape(Capsule())
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}
