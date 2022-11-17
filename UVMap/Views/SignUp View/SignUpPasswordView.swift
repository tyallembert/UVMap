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
        Text("Password")
            .fontWeight(.medium)
            .offset(x: 8, y: 12)
            .foregroundColor(Color.backgroundGreen)
        TextField("", text: $sessionManager.password)
            .foregroundColor(Color.black)
            .padding(7)
            .background(Color.white)
            .cornerRadius(100)
            .shadow(color: .black, radius: 3, x: 1, y: 2)
            .autocapitalization(.none)
    }
}

struct SignUpPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPasswordView().environmentObject(SessionManager())
    }
}
