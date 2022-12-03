//
//  PasswordView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI

struct PasswordView: View {
    @EnvironmentObject var sessionManager: SessionManager
    var body: some View {
        Text("Password")
            .fontWeight(.medium)
            .offset(x: 8, y: 12)
            .foregroundColor(Color.backgroundGreen)
        SecureTextField(password: $sessionManager.password)
            .onTapGesture {
                withAnimation{
                    sessionManager.passwordInFocus = true
                    sessionManager.usernameInFocus = false
                }
            }
            .roundedTextField(inFocus: sessionManager.passwordInFocus)
    }
}

//struct PasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordView()
//    }
//}
