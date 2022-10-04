//
//  DatabaseManager.swift
//  UVMap
//
//  Created by Ty Allembert on 10/3/22.
//

import Foundation
import Firebase

class DatabaseManager: ObservableObject{
    
    func insertData(){
        
    }
    
    func insertNewUser(netID: String, password: String){
        Auth.auth().createUser(withEmail: netID, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func signIn(netID: String, password: String){
        Auth.auth().signIn(withEmail: netID, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    // This will check if the given data is in a certain column(field) of a table
    func checkIfExists(data: String, field: String){
        
    }
    
    func queryData(){
        
    }
    
}
