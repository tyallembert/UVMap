//
//  FirstNameView.swift
//  UVMap
//
//  Created by Tate Osborne on 10/21/22.
//

import SwiftUI

struct FirstNameView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("First Name")
                .fontWeight(.medium)
                .offset(x: 8, y: 12)
                .foregroundColor(Color.backgroundGreen)
            TextField("",
                      text: $sessionManager.firstName,
                      prompt: Text("First Name")
                        .foregroundColor(Color.gray)
            )
                .onTapGesture {
                    withAnimation{
                        sessionManager.firstNameInFocus = true
                        sessionManager.lastNameInFocus = false
                        sessionManager.emailInFocus = false
                        sessionManager.passwordSUInFocus = false
                        sessionManager.confirmPasswordInFocus = false
                    }
                }
                .roundedTextField(inFocus: sessionManager.firstNameInFocus)
        }
    }
}

struct FirstNameView_Previews: PreviewProvider {
    static var previews: some View {
        FirstNameView().environmentObject(SessionManager())
    }
}
