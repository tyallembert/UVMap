//
//  SignUpInnerBoxes.swift
//  UVMap
//
//  Created by Tate Osborne on 10/21/22.
//

import SwiftUI

struct SignUpInnerBoxes: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack {
            Group {
                FirstNameView()
                Spacer()
                    .frame(height: 20)
                LastNameView()
                Spacer()
                    .frame(height: 20)
                EmailView()
                Spacer()
                    .frame(height: 20)
                NetIDView()
                Spacer()
                    .frame(height: 20)
                PasswordView()
                Spacer()
                    .frame(height: 20)
                SignUpRetypePasswordView()
                Spacer()
                    .frame(height: 20)
                SignUpButton()
            }
        }
        .padding(20)
        .frame(height: 350)
        .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
        .cornerRadius(25)
    }
}

struct SignUpInnerBoxes_Previews: PreviewProvider {
    static var previews: some View {
        SignUpInnerBoxes()
    }
}
