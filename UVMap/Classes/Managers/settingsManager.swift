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
    
    @Published var settings: [Settings] = []
    @Published var theme: Int
    @Published var prioritize: Bool
    @Published var early: Int
    @Environment(\.colorScheme) var deviceTheme: ColorScheme
    
    init(theme: Int = 1, early: Int = 10, prioritize: Bool = false){
        self.theme = theme
        self.early = early
        self.prioritize = prioritize
        newSettings = Settings(settingsTheme: theme, prioritizeSchedule: prioritize, howEarly: early)
        self.settings.append(newSettings)
    }
    
    //===Read from Json file===
    func retrieveSettingsLocally(fileName: String) -> Settings?{
        let data: Data
        
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: "json")
        else{
            print("Couldn't find \(fileName) in main bundle.")
            return nil
        }
        
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            print("Couldn't load \(fileName) from main bundle:\n\(error)")
            return nil
        }

        do {
            let decoder = JSONDecoder()
//            return try decoder.decode(T.self, from: data)
            return try decoder.decode(Settings.self, from: data)
        } catch {
            print("File is Empty: \(error)")
            return nil        }
    }
    
    // Helper function to save locally
    func getDocumentsDirectoryUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    //===Save to Json file===
    func saveSettingsLocally(){
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        print("Originial settings: \(self.settings)")
        var changedSettings = Settings(settingsTheme: self.theme, prioritizeSchedule: self.prioritize, howEarly: self.early)
        print("ChangedSettings: \(changedSettings)")
        
        //let jsonData = try! JSONEncoder().encode(settings)
        
        //let saveSettings: Settings = [saveTheme, saveEarly, savePrioritize]
        
        let fileName = "settings"
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: "json")
        else{
            print("Couldn't find \(fileName) in main bundle.")
            return
        }
//        let filePath = self.getDocumentsDirectoryUrl().appendingPathComponent(fileName)
        
        do {
            let data = try encoder.encode(newSettings)
            try data.write(to: filePath)
            print(String(data: data, encoding: .utf8)!)
            if retrieveSettingsLocally(fileName: "settings") != nil {
                print("Files saved")
                self.newSettings = changedSettings
                self.settings = [changedSettings]
            } else {
                print("File not saved")
            }
        } catch {
            fatalError("Cannot save to file:\n\(error)")
        }
    }
    
    
}
