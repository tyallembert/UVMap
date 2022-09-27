//
//  PasswordView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI

struct PasswordView: View {
    @Binding var password: String
    var body: some View {
        Text("PASSWORD")
            .fontWeight(.medium)
            .offset(x: 8, y: 12)
            .foregroundColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
        TextField("", text: $password)
            .padding(7)
            .background(Color.white)
            .cornerRadius(100)
            .shadow(color: .black, radius: 3, x: 1, y: 2)
    }
}

//struct PasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordView()
//    }
//}
