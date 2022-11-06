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
    @Published var currentState: CurrentState? = .loggedOut
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var netID: String = ""
    var password: String = ""
    var retypePassword: String = ""
    
    func signUp(database: DatabaseManager) {
        database.signUp(firstName: firstName, lastName: lastName, email: email, netID: netID, password: password, retypePassword: retypePassword)
    }
    
    func signIn(database: DatabaseManager) {
        database.signIn(netID: netID, password: password)
    }
    
}
