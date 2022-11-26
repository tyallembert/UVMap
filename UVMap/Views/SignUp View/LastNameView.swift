//
//  LastNameView.swift
//  UVMap
//
//  Created by Tate Osborne on 10/21/22.
//

import SwiftUI

struct LastNameView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Last Name")
                .fontWeight(.medium)
                .offset(x: 8, y: 12)
                .foregroundColor(Color.backgroundGreen)
            TextField("", text: $sessionManager.lastName, prompt: Text("Last Name"))
                .onTapGesture {
                    withAnimation{
                        sessionManager.firstNameInFocus = false
                        sessionManager.lastNameInFocus = true
                        sessionManager.netIDInFocus = false
                        sessionManager.emailInFocus = false
                        sessionManager.passwordSUInFocus = false
                        sessionManager.confirmPasswordInFocus = false
                    }
                }
                .roundedTextField(inFocus: sessionManager.lastNameInFocus)
        }
    }
}

struct LastNameView_Previews: PreviewProvider {
    static var previews: some View {
        LastNameView().environmentObject(SessionManager())
    }
}
