//
//  ReadBuildingsFromJSON.swift
//  UVMap
//
//  Created by Ty Allembert on 10/7/22.
//

import Foundation
import SwiftUI

func readBuildingsFromJSON<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

struct ReadInBuilding: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var abbreviation: String
    var address: String
    var latitude: String
    var longitude: String
    var city: String
    var state: String
    var street: String
}

func readCoursesFromJSON<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

struct ReadInCourse: Hashable, Codable, Identifiable {
    var id: Int
    var building: String
    var title: String
    var course: String
    var days: String
    var startTime: String
    var endTime: String
    var room: String
    var section: String
}
