//
//  SignUpView.swift
//  UVMap
//
//  Created by Tate Osborne on 10/13/22.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Login")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    SignUpInnerBoxes()
                }
                    .padding(20)
                    .padding(.bottom, 20)
                    .background(Color(red: 223 / 255, green: 223 / 255, blue: 223 / 255).opacity(0.7))
                    .cornerRadius(20)
                    .frame(width: 310)
                    .offset(y: 20)
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(7)
                    .frame(width: 100)
                    .offset(y: -270)
            }
        }
    }
}

struct SignUpView_Preview: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(SessionManager())
    }
}
