//
//  LastNameView.swift
//  UVMap
//
//  Created by Tate Osborne on 10/21/22.
//

import SwiftUI

struct LastNameView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Last Name")
                .fontWeight(.medium)
                .offset(x: 8, y: 12)
                .foregroundColor(Color.backgroundGreen)
            TextField("", text: $sessionManager.lastName,
                      prompt: Text("Last Name"))
            .foregroundColor(Color.black)
            .padding(7)
            .background(Color.white)
            .cornerRadius(100)
            .shadow(color: .black, radius: 3, x: 1, y: 2)
            .autocapitalization(.none)
        }
    }
}

struct LastNameView_Previews: PreviewProvider {
    static var previews: some View {
        LastNameView().environmentObject(SessionManager())
    }
}
