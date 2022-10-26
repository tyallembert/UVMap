//
//  ClassSearchManager.swift
//  UVMap
//
//  Created by Ty Allembert on 10/17/22.
//

import Foundation

class ClassManager: ObservableObject{
    @Published var allClasses: [SingleClass]
    @Published var studentsClasses: [SingleClass]
    //Add class variables
    @Published var searchResults: [SingleClass]
    @Published var searchText: String
    @Published var submitClicked:Int?
    
    init(){
        // in the future this will call the databaseManager.queryClasses() function
        //have a button in settings that can repull from firebase to update local courses if the user isnt finding a course
        allClasses = []
        //have this call a function that reads in students classes from local json file
        //maybe have a backup copy of their schedule saved on firebase incase they delete the app
        //have settings button that says "recover schedule" or something
        studentsClasses = []
        searchResults = []
        searchText = ""
    }
    
// ===========================
// MARK: Add Classes functions
// ===========================
    func filterClasses(){
        if searchText.isEmpty {
            searchResults = allClasses
        } else {
            searchResults = allClasses.filter { ($0.subject + $0.number).lowercased().hasPrefix(searchText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))
            }
        }
    }
    func addClass(course: SingleClass){
        if !studentsClasses.contains(where: {$0.CRN == course.CRN}){
            studentsClasses.append(course)
        }
    }
    func removeClass(course: SingleClass){
        for (index, aClass) in studentsClasses.enumerated() {
            if aClass == course {
                studentsClasses.remove(at: index)
            }
        }
    }
    
// ===========================
// MARK: Schedule functions
// ===========================
    //===Read from Json file===
    func retrieveClasssesLocally(fileName: String) -> [SingleClass]{
        let data: Data
        
//        let filePath = self.getDocumentsDirectoryUrl().appendingPathComponent(fileName)
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
            return try decoder.decode([SingleClass].self, from: data)
        } catch {
            fatalError("Couldn't parse \(fileName):\n\(error)")
        }
    }
    // Helper function to save locally
    func getDocumentsDirectoryUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    //===Save to Json file===
    func saveClassesLocally(){
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let fileName = "userClasses.json"
        let filePath = self.getDocumentsDirectoryUrl().appendingPathComponent(fileName)
        
        do {
            let data = try encoder.encode(studentsClasses)
            try data.write(to: filePath)
            print(String(data: data, encoding: .utf8)!)
            studentsClasses = retrieveClasssesLocally(fileName: "userClasses.json")
        } catch {
            fatalError("Cannot save to file:\n\(error)")
        }
        
    }
    func saveClassesToFirebase(){
        
    }
}
