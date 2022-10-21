//
//  SingleClass.swift
//  UVMap
//
//  Created by Ty Allembert on 10/17/22.
//

import Foundation
import SwiftUI

class SingleClass: Codable, ObservableObject {
    var CRN: String
    var building: String
    var course: String
    var title: String
    var days: String
    var startTime: String
    var endTime: String
    var room: String
    var section: String
    
    init(
        CRN: String,
        building: String,
        course: String,
        title: String,
        days: String,
        startTime: String,
        endTime: String,
        room: String,
        section: String
      ) {
          self.CRN = CRN
          self.building = building
          self.course = course
          self.title = title
          self.days = days
          self.startTime = startTime
          self.endTime = endTime
          self.room = room
          self.section = section
      }
    static func ==(lhs: SingleClass, rhs: SingleClass) -> Bool {
        return lhs.CRN == rhs.CRN
    }
}
