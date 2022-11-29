//
//  NetIDView.swift
//  UVMap
//
//  Created by Tate Osborne on 11/6/22.
//

import SwiftUI

struct NetIDView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("NetID")
                .fontWeight(.medium)
                .offset(x: 8, y: 12)
                .foregroundColor(Color.backgroundGreen)
            TextField("", text: $sessionManager.netID, prompt: Text("NetID"))
                .onTapGesture {
                    withAnimation{
                        sessionManager.firstNameInFocus = false
                        sessionManager.lastNameInFocus = false
                        sessionManager.netIDInFocus = true
                        sessionManager.emailInFocus = false
                        sessionManager.passwordSUInFocus = false
                        sessionManager.confirmPasswordInFocus = false
                    }
                }
                .roundedTextField(inFocus: sessionManager.netIDInFocus)
        }
    }
}

struct NetIDView_Previews: PreviewProvider {
    static var previews: some View {
        NetIDView().environmentObject(SessionManager())
    }
}
