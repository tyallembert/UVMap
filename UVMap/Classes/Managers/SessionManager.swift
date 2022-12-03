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
    
    @Published var isErrorLogIn: Bool = false
    @Published var isErrorSignUp: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var currentUser: User = User(email: "", firstName: "", lastName: "")
    
    var username: String = ""
    var password: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var passwordSU: String = ""
    var confirmPassword: String = ""
   
    func signUp(database: DatabaseManager) {
        firstNameInFocus = false
        lastNameInFocus = false
        emailInFocus = false
        passwordSUInFocus = false
        confirmPasswordInFocus = false
        
        if self.currentState == .signUp {
            if firstName.isEmpty {
                self.currentState = .signUp
                errorMessage = "First Name is empty"
                isErrorSignUp = true
                return
            }
            if lastName.isEmpty {
                self.currentState = .signUp
                errorMessage = "Last Name is empty"
                isErrorSignUp = true
                return
            }
            if email.isEmpty {
                self.currentState = .signUp
                errorMessage = "Email is empty"
                isErrorSignUp = true
                return
            }
            if !email.contains("@uvm.edu") {
                self.currentState = .signUp
                errorMessage = "Email not in correct UVM format"
                isErrorSignUp = true
                return
            }
            if passwordSU.isEmpty {
                self.currentState = .signUp
                errorMessage = "Password is empty"
                isErrorSignUp = true
                return
            }
            if confirmPassword.isEmpty {
                self.currentState = .signUp
                errorMessage = "Confirm Password is empty"
                isErrorSignUp = true
                return
            }
            if passwordSU != confirmPassword {
                self.currentState = .signUp
                errorMessage = "Passwords don't match"
                isErrorSignUp = true
                return
            }
            
            if self.currentState == .signUp || self.currentState == .loggedOut {
                self.clearInputFields()
            }
        }
        
        let _ = print("Email: \(email)")
        let _ = print("Email: \(passwordSU)")
        Auth.auth().createUser(withEmail: email, password: passwordSU) { result, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
                self.isErrorSignUp = true
                self.currentState = .signUp
            }
            database.signUp(firstName: self.firstName, lastName: self.lastName, email: self.email, password: self.passwordSU, retypePassword: self.confirmPassword)
            
            self.currentUser.email = self.email
            self.currentUser.firstName = self.firstName
            self.currentUser.lastName = self.lastName
            
            self.afterSignIn()
        }
    }
    func signOut() {
        do {
            try Auth.auth().signOut()
            clearInputFields()
        }
        catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
 
    func signIn(database: DatabaseManager){
        usernameInFocus = false
        passwordInFocus = false
        if self.currentState == .loggedOut {
            if username.isEmpty {
                errorMessage = "Email is empty"
                isErrorLogIn = true
                self.currentState = .loggedOut
                return
            }
            if password.isEmpty {
                errorMessage = "Password is empty"
                isErrorLogIn = true
                self.currentState = .loggedOut
                return
            }
        }
        Auth.auth().signIn(withEmail: username, password: password) { result, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
                self.isErrorLogIn = true
                self.currentState = .loggedOut
            }
            
            self.currentUser.email = self.username
            self.currentUser.firstName = self.firstName
            self.currentUser.lastName = self.lastName
            
            self.afterSignIn()
        }
        
        
    }
    
    func afterSignIn() {
        self.currentState = .loggedIn
        // Defaults this back to MapView
        selectedNavElement = 1
        // Clears all input boxses
        clearPasswords()
    }
    func clearPasswords() {
        passwordSU = ""
        confirmPassword = ""
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
