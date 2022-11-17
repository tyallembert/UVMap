//
//  FirstNameView.swift
//  UVMap
//
//  Created by Tate Osborne on 10/21/22.
//

import SwiftUI

struct FirstNameView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        Text("First Name")
            .fontWeight(.medium)
            .offset(x: 8, y: 12)
            .foregroundColor(Color.backgroundGreen)
        TextField("", text: $sessionManager.firstName)
            .foregroundColor(Color.black)
            .padding(7)
            .background(Color.white)
            .cornerRadius(100)
            .shadow(color: .black, radius: 3, x: 1, y: 2)
            .autocapitalization(.none)
    }
}

struct FirstNameView_Previews: PreviewProvider {
    static var previews: some View {
        FirstNameView().environmentObject(SessionManager())
    }
}
