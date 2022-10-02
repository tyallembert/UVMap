//
//  LoginButton.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI


struct LoginButton: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        Button (action: {sessionManager.signIn()}){
            Text("Login")
                .font(.title2)
                .fontWeight(.heavy)
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 200)
        .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
        .cornerRadius(10)
        .shadow(color: .black, radius: 3, x: 2, y: 3)
    }
}

//struct LoginButton_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginButton()
//    }
//}
