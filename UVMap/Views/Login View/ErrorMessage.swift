//
//  ErrorMessage.swift
//  UVMap
//
//  Created by Ty Allembert on 10/24/22.
//

import SwiftUI

struct ErrorMessage: View {
    @EnvironmentObject var sessionManager: SessionManager
    var body: some View {
        Text(sessionManager.errorMessage)
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(10)
            .offset(y: 20)
    }
}

struct ErrorMessage_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMessage()
            .environmentObject(SessionManager())
    }
}
