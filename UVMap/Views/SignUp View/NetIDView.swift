//
//  NetIDView.swift
//  UVMap
//
//  Created by Tate Osborne on 11/6/22.
//

import SwiftUI

struct NetIDView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        Text("NetID")
            .fontWeight(.medium)
            .offset(x: 8, y: 12)
            .foregroundColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
        TextField("", text: $sessionManager.netID)
            .foregroundColor(Color.black)
            .padding(7)
            .background(Color.white)
            .cornerRadius(100)
            .shadow(color: .black, radius: 3, x: 1, y: 2)
            .autocapitalization(.none)
    }
}

struct NetIDView_Previews: PreviewProvider {
    static var previews: some View {
        NetIDView().environmentObject(SessionManager())
    }
}
