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
            HStack {
                FirstNameView()
                LastNameView()
            }
            VStack(alignment: .leading) {
                NetIDView()
            }
            VStack(alignment: .leading) {
                EmailView()
            }
            VStack(alignment: .leading) {
                PasswordView()
            }
            VStack(alignment: .leading) {
                SignUpRetypePasswordView()
            }
            SignUpButton()
            Spacer()
                .frame(height: 20)
        }
        .padding(20)
        .frame(height: 650)
        .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
        .cornerRadius(25)
        .offset(y: 50)
    }
}

struct SignUpInnerBoxes_Previews: PreviewProvider {
    static var previews: some View {
        SignUpInnerBoxes()
    }
}
