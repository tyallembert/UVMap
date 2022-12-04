//
//  SignOutButton.swift
//  UVMap
//
//  Created by Jack McGowan on 11/28/22.
//

import SwiftUI

// the view for the design of the sign out button
struct SignOutButton: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var icon: String = "rectangle.portrait.and.arrow.right.fill"
    
    var body: some View {
        Button(role: .destructive) {
            sessionManager.signOut()
        } label: {
            Label("Sign out", systemImage: icon)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                .font(.system(size: 20, weight: .bold))
        }
//        .padding()
//        .backgroundBlur(radius: 25, opaque: true)
//        .background(.red)
//        .foregroundColor(.white)
////        .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: Color.innerShadow, lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1)
//        .cornerRadius(10)
//        .shadow(radius: 5)
        
        .font(.title2)
        .padding(20)
        .frame(width: 170, height: 60)
        .foregroundColor(Color.white)
        .background(Color.red)
        .border(Color.red, width: 5)
        .clipShape(Capsule())
    }
}

struct SignOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButton()
            .environmentObject(SessionManager())
    }
}
