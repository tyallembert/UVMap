//
//  SingleClass.swift
//  UVMap
//
//  Created by Ty Allembert on 10/17/22.
//

import Foundation
import SwiftUI

// this class describes a Class object
class SingleClass: Codable, Identifiable, ObservableObject {
    enum CodingKeys: CodingKey {
        case CRN
        case subject
        case number
        case section
        case title
        case building
        case room
        case days
        case startTime
        case endTime
        case instructor
        case email
    }
    
    var id: UUID = UUID()
    var CRN: Int
    var subject: String
    var number: String
    var section: String
    var title: String
    var building: String
    var room: String
    var days: String
    var startTime: String
    var endTime: String
    var instructor: String
    var email: String
    
    init(
        CRN: Int,
        subject: String,
        number: String,
        section: String,
        title: String,
        building: String,
        room: String,
        days: String,
        startTime: String,
        endTime: String,
        instructor: String,
        email: String
    ) {
        self.CRN = CRN
        self.subject = subject
        self.number = number
        self.section = section
        self.title = title
        self.building = building
        self.room = room
        self.days = days
        self.startTime = startTime
        self.endTime = endTime
        self.instructor = instructor
        self.email = email
    }
    static func ==(lhs: SingleClass, rhs: SingleClass) -> Bool {
        return lhs.CRN == rhs.CRN
    }
}
