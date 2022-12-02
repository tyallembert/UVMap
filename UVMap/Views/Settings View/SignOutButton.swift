//
//  SignOutButton.swift
//  UVMap
//
//  Created by Jack McGowan on 11/28/22.
//

import SwiftUI

struct SignOutButton: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    
    var body: some View {
        Button(role: .destructive) {
            sessionManager.signOut()
        } label: {
            Label("Sign Out", systemImage: "exclamationmark.octagon")
                .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                .font(.system(size: 20, weight: .bold))
        }
        .padding()
        .backgroundBlur(radius: 25, opaque: true)
        .background(.red)
        .foregroundColor(.white)
//        .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: Color.innerShadow, lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct SignOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButton()
            .environmentObject(SessionManager())
    }
}
