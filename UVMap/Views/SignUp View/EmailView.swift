//
//  EmailView.swift
//  UVMap
//
//  Created by Tate Osborne on 10/27/22.
//

import SwiftUI

// change
struct EmailView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("UVM Email")
                .fontWeight(.medium)
                .offset(x: 8, y: 12)
                .foregroundColor(Color.backgroundGreen)
            TextField("",
                      text: $sessionManager.email,
                      prompt: Text("@uvm.edu")
                        .foregroundColor(Color.gray)
            )
                .onTapGesture {
                    withAnimation{
                        sessionManager.firstNameInFocus = false
                        sessionManager.lastNameInFocus = false
                        sessionManager.emailInFocus = true
                        sessionManager.passwordSUInFocus = false
                        sessionManager.confirmPasswordInFocus = false
                    }
                }
                .roundedTextField(inFocus: sessionManager.emailInFocus)
            
        }
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView().environmentObject(SessionManager())
    }
}
