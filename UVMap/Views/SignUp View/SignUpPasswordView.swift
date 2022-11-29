//
//  SignUpPasswordView.swift
//  UVMap
//
//  Created by Tate Osborne on 10/27/22.
//

import SwiftUI

struct SignUpPasswordView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Password")
                .fontWeight(.medium)
                .offset(x: 8, y: 12)
                .foregroundColor(Color.backgroundGreen)
            SecureField("", text: $sessionManager.passwordSU, prompt: Text("Password"))
                .onTapGesture {
                    withAnimation{
                        sessionManager.firstNameInFocus = false
                        sessionManager.lastNameInFocus = false
                        sessionManager.emailInFocus = false
                        sessionManager.passwordSUInFocus = true
                        sessionManager.confirmPasswordInFocus = false
                    }
                }
                .roundedTextField(inFocus: sessionManager.passwordSUInFocus)
        }
    }
}

struct SignUpPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPasswordView().environmentObject(SessionManager())
    }
}
