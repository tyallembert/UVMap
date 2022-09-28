//
//  LoginButton.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI


struct LoginButton: View {
    let TEMP_USERNAME = "Tyallembert"
    let TEMP_PASS = "example"
    @Binding var username: String
    @Binding var password: String
    @Binding var loggedIn: Bool
    
    func handleButtonClick(){
        if username == TEMP_USERNAME && password == TEMP_PASS {
            let _ = print("logged in")
            loggedIn = true
        }else{
            let _ = print("failed to log in")
        }
    }
    var body: some View {
        Button (action: {handleButtonClick()}){
            Text("Login")
                .font(.title2)
                .fontWeight(.heavy)
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 200)
        .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
        .cornerRadius(10)
        .shadow(color: .black, radius: 3, x: 2, y: 3)
    }
}

//struct LoginButton_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginButton()
//    }
//}
