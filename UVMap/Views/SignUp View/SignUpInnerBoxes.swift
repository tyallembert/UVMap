//
//  SignUpInnerBoxes.swift
//  UVMap
//
//  Created by Tate Osborne on 10/21/22.
//

import SwiftUI

// this view organizes the inner components of the sign up view
struct SignUpInnerBoxes: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack {
            if sessionManager.isErrorSignUp {
                ErrorMessage()
            }
            Spacer()
                .frame(height: 10)
            HStack {
                FirstNameView()
                Spacer()
                    .frame(width: 10)
                LastNameView()
            }
            EmailView()
            SignUpPasswordView()
            SignUpRetypePasswordView()
            Spacer()
                .frame(height: 20)
            SignUpButton()
            Spacer()
                .frame(height: 20)
            Button {
                sessionManager.currentState = .loggedOut
            } label: {
                VStack {
                    Text("Sign in")
                        .underline()
                }
            }
        }
            .padding(20)
//            .frame(height: 480)
            .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
            .cornerRadius(25)
            .offset(y: 15)
    }
}

struct SignUpInnerBoxes_Previews: PreviewProvider {
    static var previews: some View {
        SignUpInnerBoxes()
            .environmentObject(SessionManager())
    }
}
