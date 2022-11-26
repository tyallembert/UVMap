//
//  SignUpRetypePasswordView.swift
//  UVMap
//
//  Created by Tate Osborne on 10/27/22.
//

import SwiftUI

struct SignUpRetypePasswordView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Re-enter Password")
                .fontWeight(.medium)
                .offset(x: 8, y: 12)
                .foregroundColor(Color.backgroundGreen)
            TextField("", text: $sessionManager.retypePassword,
                      prompt: Text("Re-type Password"))
                .foregroundColor(Color.black)
                .padding(7)
                .background(Color.white)
                .cornerRadius(100)
                .shadow(color: .black, radius: 3, x: 1, y: 2)
                .autocapitalization(.none)
        }
    }
}

struct SignUpRetypePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpRetypePasswordView().environmentObject(SessionManager())
    }
}
