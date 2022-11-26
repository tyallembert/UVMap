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
                Spacer()
                    .frame(width: 10)
                LastNameView()
            }
            
            NetIDView()
            EmailView()
            SignUpPasswordView()
            SignUpRetypePasswordView()
            Spacer()
                .frame(height: 20)
            
            SignUpButton()
            Spacer()
                .frame(height: 20)
        }
            .padding(20)
            .frame(height: 500)
            .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
            .cornerRadius(25)
            .offset(y: 10)
    }
}

struct SignUpInnerBoxes_Previews: PreviewProvider {
    static var previews: some View {
        SignUpInnerBoxes()
            .environmentObject(SessionManager())
    }
}
