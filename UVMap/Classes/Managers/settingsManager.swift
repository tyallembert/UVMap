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
        var settingsTheme: Int
        var prioritizeSchedule: Bool
        var howEarly: Int
    }
    var newSettings: Settings
    
    @Published var currentSettings: Settings
    @Environment(\.colorScheme) var deviceTheme: ColorScheme
    
    init(theme: Int = 1, early: Int = 10, prioritize: Bool = false){
//        self.theme = theme
//        self.early = early
//        self.prioritize = prioritize
//        self.settings.append(newSettings)
        self.newSettings = Settings(settingsTheme: theme, prioritizeSchedule: prioritize, howEarly: early)
        self.currentSettings = Settings(settingsTheme: theme, prioritizeSchedule: prioritize, howEarly: early)
        if let settings = self.retrieveSettingsLocally(fileName: "settings"){
            self.currentSettings = settings
        }
    }
    
    func earlyCalculation(inTime: String, eta: Int, earlyOffset: Int) -> String{
        let time = inTime
        let timeToRemove = eta + earlyOffset
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "HH:mm"
        if let startTime = timeFormat.date(from: time) {
            
            if let modifiedDate = Calendar.current.date(byAdding: .minute, value: -timeToRemove, to: startTime){
                let calendar = Calendar.current
                let outDate = ("\(calendar.component(.hour, from: modifiedDate)):\(calendar.component(.minute, from: modifiedDate))")
                timeFormat.date(from: outDate)
                print(String(describing: modifiedDate))
                print(outDate)
                return outDate
            } else {
                print("Early calc fail 2")
                return ("Early calc fail 2")
            }
            

        } else {
            print("Early calculation fail")
            return ("In time not formatted")
        }
    }
    
    func arrivalIfLeaveNow (eta: Int) -> String{
        let calendar = Calendar.current
        let date = Date()
        if let modifiedDate = Calendar.current.date(byAdding: .minute, value: eta, to: date){
            return ("\(calendar.component(.hour, from: modifiedDate)):\(calendar.component(.minute, from: modifiedDate))")
        } else {
            return ("Arrival fail 1")
        }
    }
    
    //===Read from Json file===
    func retrieveSettingsLocally(fileName: String) -> Settings?{
        let data: Data
        let fileName = "settings.json"
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                            in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent(fileName)
            let _ = print("Read path: \(pathWithFilename)")
            
            do {
                data = try Data(contentsOf: pathWithFilename)
            } catch {
                print("Couldn't load \(fileName) from main bundle:\n\(error)")
                return nil
            }
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(Settings.self, from: data)
            } catch {
                fatalError("Cannot save to file:\n\(error)")
            }
        }
        return nil
    }
    
    // Helper function to save locally
    func getDocumentsDirectoryUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    //===Save to Json file===
    func saveSettingsLocally(){
        
        let fileName = "settings.json"
        let encoder = JSONEncoder()
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                            in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent(fileName)
            let _ = print("Write path: \(pathWithFilename)")
            do {
                let data = try encoder.encode(currentSettings)
                try data.write(to: pathWithFilename)
                print(String(data: data, encoding: .utf8)!)
                if let settings = retrieveSettingsLocally(fileName: "settings") {
                    print("Files saved")
                    self.currentSettings = settings
                } else {
                    print("File not saved")
                }
            } catch {
                fatalError("Cannot save to file:\n\(error)")
            }
        }
    }
}
