//
//  Lecture.swift
//  UVMap
//
//  Created by nate lalor on 10/13/22.
//

import Foundation
import MapKit

// this class describes a Lecture object
class Lecture: NSObject, Identifiable {
    var name: String        // EX: CS 275
    var time: String        // EX: 8:30am - 9:20am
    var professor: String   // EX: Jason Darulo
    var building: String    // EX: Cohen 120
    
    init(
        name: String,
        time: String,
        professor: String,
        building: String
      ) {
        self.name = name
        self.time = time
        self.professor = professor
        self.building = building
      }
    
    // function that returns name variable
    func getName(name: String) -> String {
        
        return name
    }
    
    // function that reutns time variable
    func getTime(time: String) -> String {
        
        return time
    }
    
    // function that returns professor variable
    func getProfessor(professor: String) -> String {
        
        return professor
    }
    
    // function that returns building variable
    func getBuilding(building: String) -> String {
        
        return building
    }
    
    
    
    
}
