//
//  SignUpRetypePasswordView.swift
//  UVMap
//
//  Created by Tate Osborne on 10/27/22.
//

import SwiftUI

// the view for the confirm password input field in sign up 
struct SignUpRetypePasswordView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Confirm Password")
                .fontWeight(.medium)
                .offset(x: 8, y: 12)
                .foregroundColor(Color.backgroundGreen)
            SecureTextField(password: $sessionManager.confirmPassword)
                .onTapGesture {
                    withAnimation{
                        sessionManager.firstNameInFocus = false
                        sessionManager.lastNameInFocus = false
                        sessionManager.emailInFocus = false
                        sessionManager.passwordSUInFocus = false
                        sessionManager.confirmPasswordInFocus = true
                    }
                }
                .roundedTextField(inFocus: sessionManager.confirmPasswordInFocus)
        }
    }
}

struct SignUpRetypePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpRetypePasswordView().environmentObject(SessionManager())
    }
}
