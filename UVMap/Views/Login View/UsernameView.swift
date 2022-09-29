//
//  UsernameView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI

struct UsernameView: View {
    @Binding var username: String
    
    var body: some View {
        Text("NETID")
            .fontWeight(.medium)
            .offset(x: 8, y: 12)
            .foregroundColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
        TextField("", text: $username)
            .padding(7)
            .background(Color.white)
            .cornerRadius(100)
            .shadow(color: .black, radius: 3, x: 1, y: 2)
            .autocapitalization(.none)
    }
}

//struct UsernameView_Previews: PreviewProvider {
//    static var previews: some View {
//        UsernameView(username: $username)
//    }
//}
