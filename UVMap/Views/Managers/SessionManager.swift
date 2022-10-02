//
//  SessionManager.swift
//  UVMap
//
//  Created by Ty Allembert on 9/30/22.
//

import Foundation

// This function manages the login process
final class SessionManager: ObservableObject{
    enum CurrentState {
        case loggedIn
        case loggedOut
    }
    @Published private(set) var currentState: CurrentState? = .loggedOut
    var username: String = ""
    var password: String = ""
    
    
    func signIn(){
        let TEMP_USERNAME = "tallembe"
        let TEMP_PASS = "example"
        if username == TEMP_USERNAME && password == TEMP_PASS {
            currentState = .loggedIn
            let _ = print("logged in")
        }else{
            let _ = print("failed to log in")
        }
    }
}
