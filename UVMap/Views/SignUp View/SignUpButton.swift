//
//  SignUpButton.swift
//  UVMap
//
//  Created by Tate Osborne on 10/21/22.
//

import SwiftUI

// the view for the sign up button
struct SignUpButton: View {
    @EnvironmentObject var sessionManager: SessionManager
    @EnvironmentObject var databaseManager: DatabaseManager
    
    var icon = "person.circle.fill"
    
    var body: some View {
        Button {
            sessionManager.currentState = .loading
            sessionManager.signUp(database: databaseManager)
            
        } label: {
            Label("Sign up", systemImage: icon)
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

struct SignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButton()
    }
}
