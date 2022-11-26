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
   
    @Published var firstNameInFocus: Bool = false
    @Published var lastNameInFocus: Bool = false
    @Published var netIDInFocus: Bool = false
    @Published var emailInFocus: Bool = false
    @Published var passwordSUInFocus: Bool = false
    @Published var confirmPasswordInFocus: Bool = false
    
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    var username: String = ""
    var password: String = ""

    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var netID: String = ""
    var passwordSU: String = ""
    var confirmPassword: String = ""
   
    func signUp(database: DatabaseManager) {
        if firstName.isEmpty {
            errorMessage = "First Name is empty"
            isError = true
            return
        }
        if lastName.isEmpty {
            errorMessage = "Last Name is empty"
            isError = true
            return
        }
        if netID.isEmpty {
            errorMessage = "NetID is empty"
            isError = true
            return
        }
        if email.isEmpty {
            errorMessage = "Email is empty"
            isError = true
            return
        }
        if !email.contains("@uvm.edu") {
            errorMessage = "Email not in correct UVM format"
            isError = true
            return
        }
        if password.isEmpty {
            errorMessage = "Password is empty"
            isError = true
            return
        }
        if confirmPassword.isEmpty {
            errorMessage = "Confirm Password is empty"
            isError = true
            return
        }
        if password != confirmPassword {
            errorMessage = "Passwords don't match"
            isError = true
            return
        }
        
        Auth.auth().createUser(withEmail: netID, password: password) { result, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
                self.isError = true
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
