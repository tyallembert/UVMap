//
//  InnerBox.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI

struct InnerBox: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack{//inner box
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

        }
        .padding(20)
        .frame(height: 350)
        .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
        .cornerRadius(25)
    }
}

struct InnerBox_Previews: PreviewProvider {
    static var previews: some View {
        InnerBox()
    }
}
