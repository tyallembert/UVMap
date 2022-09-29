//
//  LoginView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI

struct LoginView: View {
    @Binding var loggedIn: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Login")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {//outer box
                    InnerBox(loggedIn: $loggedIn)
                }
                .padding(20)
                .background(Color(red: 223 / 255, green: 223 / 255, blue: 223 / 255).opacity(0.7))
                .cornerRadius(20)
                .frame(width: 310)
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(7)
                    .frame(width: 100)
                    .offset(y: -200)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loggedIn: .constant(false))
    }
}

final class loginManager{
    
}
