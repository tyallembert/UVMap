//
//  SecureTextField.swift
//  UVMap
//
//  Created by Tate P. Osborne on 12/3/22.
//

import SwiftUI

// making the password input fields secure and having show/hide button for what's inputted
struct SecureTextField: View {
    
    @State var isSecureField: Bool = true
    @Binding var password: String
    
    var body: some View {
        HStack {
            if isSecureField {
                SecureField("",
                            text: $password,
                            prompt: Text("Password")
                                .foregroundColor(Color.gray)
                )
            } else {
                TextField("",
                          text: $password,
                          prompt: Text("Password")
                            .foregroundColor(Color.gray)
                )
            }
        }.overlay(alignment: .trailing) {
            Image(systemName: isSecureField ? "eye.slash" : "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
}
