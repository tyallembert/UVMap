//
//  SessionManager.swift
//  UVMap
//
//  Created by Ty Allembert on 9/30/22.
//

import Foundation
import Firebase

// This function manages the login process
class SessionManager: ObservableObject {
    enum CurrentState {
        case loggedIn, loggedOut, signUp, loading
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
   
    func signUp(database: DatabaseManager) {
        Auth.auth().createUser(withEmail: netID, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
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
        Auth.auth().signIn(withEmail: username, password: password) { result, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
                self.isError = true
            }
        }
    }
    
}
