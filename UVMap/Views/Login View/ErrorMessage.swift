//
//  ErrorMessage.swift
//  UVMap
//
//  Created by Ty Allembert on 10/24/22.
//

import SwiftUI

// view for the error message that pops up if something is inputted incorrectly
struct ErrorMessage: View {
    @EnvironmentObject var sessionManager: SessionManager
    var body: some View {
        Text(sessionManager.errorMessage)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.white)
            .padding(10)
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
