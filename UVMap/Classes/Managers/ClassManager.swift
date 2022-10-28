//
//  ClassSearchManager.swift
//  UVMap
//
//  Created by Ty Allembert on 10/17/22.
//

import Foundation

class ClassManager: ObservableObject{
    @Published var allClasses: [SingleClass]
    @Published var searchResults: [SingleClass]
    @Published var classesToBeAdded: [SingleClass]
    @Published var searchText: String
    
    init(){
        allClasses = [SingleClass(CRN: "235425", building: "Cohen", course: "CS 275", title: "Mobile Development", days: "T/Th", startTime: "10:05", endTime: "11:20", room: "Cohen 120", section: "A"),
                      SingleClass(CRN: "235426", building: "Cohen", course: "CS 201", title: "Mobile Development", days: "T/Th", startTime: "10:05", endTime: "11:20", room: "Cohen 120", section: "A"),
                      SingleClass(CRN: "235427", building: "Cohen", course: "CS 224", title: "Mobile Development", days: "T/Th", startTime: "10:05", endTime: "11:20", room: "Cohen 120", section: "A"),
                      SingleClass(CRN: "235428", building: "Cohen", course: "CS 008", title: "Mobile Development", days: "T/Th", startTime: "10:05", endTime: "11:20", room: "Cohen 120", section: "A"),
                      SingleClass(CRN: "235429", building: "Cohen", course: "ARTS 001", title: "Mobile Development", days: "T/Th", startTime: "10:05", endTime: "11:20", room: "Cohen 120", section: "A")]
        searchResults = []
        classesToBeAdded = []
        searchText = ""
        
        //date week init
        fetchCurrentWeek()
        
    }
    func filterClasses(){
        if searchText.isEmpty {
            searchResults = allClasses
        } else {
            searchResults = allClasses.filter { $0.course.contains(searchText) }
        }
    }
    func addClass(course: SingleClass){
        if !classesToBeAdded.contains(where: {$0.CRN == course.CRN}){
            classesToBeAdded.append(course)
        }
    }
    func removeClass(course: SingleClass){
        for (index, aClass) in classesToBeAdded.enumerated() {
            if aClass == course {
                classesToBeAdded.remove(at: index)
            }
        }
    }
    
    // SCHEDULE STUFF:
    // Data & Time implementation
    
    @Published var currentWeek: [Date] = []
    
    
    func fetchCurrentWeek() {
        
        let today = Date()
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay){
                currentWeek.append(weekday)
            }
        }
        
        
    }
    
    // extracting date
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    //source: https://www.youtube.com/watch?v=nKHrsrmA4lM //
    
    
    
    
    
    
}
