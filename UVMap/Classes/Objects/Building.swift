//
//  Building.swift
//  UVMap
//
//  Created by Ty Allembert on 10/7/22.
//

import Foundation
import MapKit

class Building: NSObject, Identifiable, MKAnnotation, ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case id
        case name
        case address
        case coordinate
    }
    
    var id: String
    var name: String
    var address: String
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

extension CLLocationCoordinate2D: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(longitude)
        try container.encode(latitude)
    }
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let longitude = try container.decode(CLLocationDegrees.self)
        let latitude = try container.decode(CLLocationDegrees.self)
        self.init(latitude: latitude, longitude: longitude)
    }
}
