//
//  SessionManager.swift
//  UVMap
//
//  Created by Ty Allembert on 9/30/22.
//

import Foundation

// This function manages the login process
class SessionManager: ObservableObject {
    enum CurrentState {
        case loggedIn, loggedOut, loading
    }
    
  
    @Published var selectedNavElement = 1
    @Published var currentState: CurrentState?
    
    @Published var usernameInFocus: Bool = false
    @Published var passwordInFocus: Bool = false
    
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""

    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var netID: String = ""
    var password: String = ""
    var retypePassword: String = ""
    
    var username: String = ""
    var password: String = ""
   
    func signUp(database: DatabaseManager) {
        database.signUp(firstName: firstName, lastName: lastName, email: email, netID: netID, password: password, retypePassword: retypePassword)
    }
 
    func signIn(database: DatabaseManager){
    usernameInFocus = false
    passwordInFocus = false
        if username.isEmpty {
            errorMessage = "Email is empty"
            isError = true
            return
        }
        if password.isEmpty {
            errorMessage = "Password is empty"
            isError = true
            return
        }
        database.signIn(netID: username, password: password)
    }
    
}
