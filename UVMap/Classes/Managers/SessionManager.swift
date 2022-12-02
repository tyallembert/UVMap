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
    var passwordSU: String = ""
    var confirmPassword: String = ""
   
    func signUp(database: DatabaseManager) {
        if firstName.isEmpty {
            self.currentState = .signUp
            errorMessage = "First Name is empty"
            isError = true
            return
        }
        if lastName.isEmpty {
            self.currentState = .signUp
            errorMessage = "Last Name is empty"
            isError = true
            return
        }
        if email.isEmpty {
            self.currentState = .signUp
            errorMessage = "Email is empty"
            isError = true
            return
        }
        if !email.contains("@uvm.edu") {
            self.currentState = .signUp
            errorMessage = "Email not in correct UVM format"
            isError = true
            return
        }
        if password.isEmpty {
            self.currentState = .signUp
            errorMessage = "Password is empty"
            isError = true
            return
        }
        if confirmPassword.isEmpty {
            self.currentState = .signUp
            errorMessage = "Confirm Password is empty"
            isError = true
            return
        }
        if password != confirmPassword {
            self.currentState = .signUp
            errorMessage = "Passwords don't match"
            isError = true
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
                self.isError = true
                self.currentState = .signUp
            }
            self.afterSignIn()
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
            self.currentState = .loggedOut
            return
        }
        if password.isEmpty {
            errorMessage = "Password is empty"
            isError = true
            self.currentState = .loggedOut
            return
        }
        Auth.auth().signIn(withEmail: username, password: password) { result, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
                self.isError = true
                self.currentState = .loggedOut
            }
            Thread.sleep(forTimeInterval: 0.5)
            self.afterSignIn()
        }
        
        
    }
    
    func afterSignIn() {
        self.currentState = .loggedIn
        // Defaults this back to MapView
        selectedNavElement = 1
        // Clears all input boxses
        clearInputFields()
    }
    
    func clearInputFields() {
        username = ""
        password = ""
        firstName = ""
        lastName = ""
        email = ""
        passwordSU = ""
        confirmPassword = ""
    }
    
}
