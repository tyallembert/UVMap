//
//  settingsManager.swift
//  UVMap
//
//  Created by user227524 on 10/21/22.
//

import Foundation
import SwiftUI

class SettingsManager: ObservableObject{
    struct Settings: Codable {
        var settingsTheme: String
        var prioritizeSchedule: Bool
        var howEarly: Int
    }
    @Published var settings: [Settings]
    @Environment(\.colorScheme) var deviceTheme: ColorScheme
    
    //===Read from Json file===
    func retrieveClasssesLocally(fileName: String) -> [Settings]{
        let data: Data
        
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: "json")
        else{
            print("Couldn't find \(fileName) in main bundle.")
            return []
        }
        
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            print("Couldn't load \(fileName) from main bundle:\n\(error)")
            return []
        }

        do {
            let decoder = JSONDecoder()
//            return try decoder.decode(T.self, from: data)
            return try decoder.decode([Settings].self, from: data)
        } catch {
            print("File is Empty: \(error)")
            return []
        }
    }
    
    init(){
        settings = []
    }
}
