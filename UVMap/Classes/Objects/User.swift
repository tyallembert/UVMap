//
//  User.swift
//  UVMap
//
//  Created by Ty Allembert on 12/2/22.
//

import SwiftUI
import Foundation

class User: ObservableObject {
    var email: String
    var firstName: String
    var lastName: String
    init(email: String = "", firstName: String = "", lastName: String = ""){
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
}
