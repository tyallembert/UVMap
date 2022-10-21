//
//  SessionManager.swift
//  UVMap
//
//  Created by Ty Allembert on 9/30/22.
//

import Foundation

// This function manages the login process
class SessionManager: ObservableObject{
    enum CurrentState {
        case loggedIn, loggedOut, loading
    }
    @Published var selectedNavElement = 1
    @Published var currentState: CurrentState?
    var username: String = ""
    var password: String = ""
    
    func signIn(database: DatabaseManager){
        database.signIn(netID: username, password: password)
    }
}
