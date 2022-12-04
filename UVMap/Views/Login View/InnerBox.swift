//
//  InnerBox.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI

// this view organizes the inner components of the log in view
struct InnerBox: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack{//inner box
            if sessionManager.isErrorLogIn {
                ErrorMessage()
            }
            VStack(alignment: .leading) {
                UsernameView()
            }
            Spacer()
                .frame(height: 20)
            VStack(alignment: .leading) {
                PasswordView()
            }
            Spacer()
                .frame(height: 20)
            LoginButton()
            Spacer()
                .frame(height: 20)
            Button{
                sessionManager.currentState = .signUp
            }label:{
                VStack {
                    Text("Sign up")
                        .underline()
                }
            }
        }
        .padding(15)
        .frame(height: 350)
        .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
        .cornerRadius(25)
    }
}

struct InnerBox_Previews: PreviewProvider {
    static var previews: some View {
        InnerBox()
            .environmentObject(SessionManager())
    }
}
