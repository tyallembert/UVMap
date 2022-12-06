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
    
  
    // declare sessionManager fields for the current session of the app
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
    
    //below is a good source for user auth with firebase
    //https://blckbirds.com/post/user-authentication-with-swiftui-and-firebase/
    // function to handle user sign up authentication
    func signUp(database: DatabaseManager) {
        firstNameInFocus = false
        lastNameInFocus = false
        emailInFocus = false
        passwordSUInFocus = false
        confirmPasswordInFocus = false
        
        // ensure the fields are all populated correctly
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
        
        
        let _ = print("Email: \(email)")
        let _ = print("Email: \(passwordSU)")
        
        // add user to the FireBase database
        Auth.auth().createUser(withEmail: email, password: passwordSU) { result, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
                self.isErrorSignUp = true
                self.currentState = .signUp
            }
            
            switch result {
            case .none:
                print("Could not sign up user.")
            case .some(_):
                print("User signed up")
                database.signUp(firstName: self.firstName, lastName: self.lastName, email: self.email, password: self.passwordSU, retypePassword: self.confirmPassword)
                self.afterSignIn()
            }
            
            
        }
    }
    
    // function handling the sign out process
    func signOut() {
        do {
            try Auth.auth().signOut()
            clearInputFields()
        }
        catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
 
    // function handling sign in process for an existing user
    func signIn(database: DatabaseManager){
        usernameInFocus = false
        passwordInFocus = false
        
        // ensure fields are populated correctly
        if username.isEmpty {
            errorMessage = "Got here"
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
//        Auth.auth().userAccessGroup
        // ensure user exists in FireBase database already, and make sure sign in info is correct
        Auth.auth().signIn(withEmail: username, password: password) { authResult, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
                self.isErrorLogIn = true
                self.currentState = .loggedOut
            }
            switch authResult {
            case .none:
                print("Could not sign in user.")
                self.currentState = .loggedOut
            case .some(_):
                print("User signed in")
                self.afterSignIn()
            }
            //            let _ = print("access: \(result!.user.isAnonymous)")
            
        }
        
        
    }
    
    // after sign in, change view
    func afterSignIn() {
        self.currentState = .loggedIn
        // Defaults this back to MapView
        selectedNavElement = 1
        // Clears all input boxses
        clearPasswords()
    }
    
    // the two following functions clear the input fields for sign up and sign in fields
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
        self.errorMessage = ""
        self.isErrorLogIn = false
    }
    
}
