//
//  Building.swift
//  UVMap
//
//  Created by Ty Allembert on 10/7/22.
//

import Foundation
import MapKit

class Building: NSObject, Identifiable, MKAnnotation {
    var id: String
    var name: String
    var address: String
//    var latitude: String
//    var longitude: String
    var coordinate: CLLocationCoordinate2D
    
    init(
        id: String,
        name: String,
        address: String,
        coordinate: CLLocationCoordinate2D
      ) {
        self.id = id
        self.name = name
        self.address = address
        self.coordinate = coordinate
      }
}
