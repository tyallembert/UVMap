//
//  DatabaseManager.swift
//  UVMap
//
//  Created by Ty Allembert on 10/3/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import MapKit

class AdminDatabaseManager: ObservableObject{
    
    let fireStoreDB = Firestore.firestore()
    var buildings: [Building] = []
    var courses: [SingleClass] = []
    
    init(){
//        self.queryBuildings()
    }
    
    // --------------------------------
    //      ===Building Functions===
    // --------------------------------
//    func queryBuildings(){
//        self.buildings.removeAll()
//        let ref = fireStoreDB.collection("Buildings")
//        ref.getDocuments{ snapshot, error in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return
//            }
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data()
//                    //once the building class is made, make each building
//                    let id = document.documentID
//                    let name = data["name"] as? String ?? ""
//                    let address = data["address"] as? String ?? ""
//
//                    var coordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
//                    if let latitude = Double(data["latitude"] as! Substring){
//                        if let longitude = Double(data["longitude"] as! Substring){
//                            coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//                        }else{
//                            let _ = print("longitude not set")
//                        }
//                    }else{
//                        let _ = print("latitude not set")
//                    }
////                    as? Double ?? 0.0
////                    let longitude = Double(data["longitude"]) as? Double ?? 0.0
//
//                    let aBuilding = Building(id: id, name: name, address: address, coordinate: coordinate)
//                    self.buildings.append(aBuilding)
//                }
//            }
//        }
//    }
    //This function is for writing a new building to the database
    func writeBuildings(){
        let newBuildings: [ReadInBuilding] = readBuildingsFromJSON("all_buildings.json")
//        self.queryBuildings()
        
        for building in newBuildings {
            var buildingInDatabase = false
            
            let name = building.title
//            let address = building.address
            let latitude = building.latitude
            let longitude = building.longitude
            //checks latitude and longitude to see if that coordinate
            //is already in the database
            for building2 in self.buildings {
                
                if !buildingInDatabase {
                    if building2.coordinate.latitude == Double(latitude.trimmingCharacters(in: .whitespacesAndNewlines)) && building2.coordinate.longitude == Double(longitude.trimmingCharacters(in: .whitespacesAndNewlines)) {
                        buildingInDatabase = true
                    }else{
                        buildingInDatabase = false
                    }
                }
            }
            //add to database if it isn't already in there
            if !buildingInDatabase {
                let ref = fireStoreDB.collection("Buildings").document()
                ref.setData(["name": name, "latitude": latitude, "longitude": longitude]) {error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        // --------------------------------
        //      ===Courses Functions===
        // --------------------------------
        
        func writeCourses(){
            let newCourses: [ReadInCourse] = readCoursesFromJSON("all_courses.json")
            
            for course in newCourses {
                
                let CRN = course.id
                let building = course.building
                let title = course.title
                let course = course.course
//                let days = course.days
                //                let startTime = course.startTime
                //                let endTime = course.endTime
                //                let room = course.room
                //                let section = course.section
                
                //add to database if it isn't already in there
                let ref = fireStoreDB.collection("Classes").document()
                ref.setData(["CRN": CRN, "building": building, "course": course]) {error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    
                }
            }
        }
    }
}
