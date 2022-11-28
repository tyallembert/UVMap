//
//  UsernameView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI

struct UsernameView: View {
    @EnvironmentObject var sessionManager: SessionManager
    var body: some View {
        Text("UVM Email")
            .fontWeight(.medium)
            .offset(x: 8, y: 12)
            .foregroundColor(Color.backgroundGreen)
        TextField("", text: $sessionManager.username)
            .onTapGesture {
                withAnimation{
                    sessionManager.usernameInFocus = true
                    sessionManager.passwordInFocus = false
                }
            }
            .roundedTextField(inFocus: sessionManager.usernameInFocus)
    }
}

struct UsernameView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameView()
            .environmentObject(SessionManager())
    }
}
