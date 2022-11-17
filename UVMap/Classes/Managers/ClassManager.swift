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
    @Published var todaysClasses: [SingleClass]
    @Published var activeClass: SingleClass?
    //Add class variables
    @Published var searchResults: [SingleClass]
    @Published var searchText: String
    @Published var searchActive: Bool
    @Published var activeDay: Date
    
    init(){
        //have a button in settings that can repull from firebase to update local courses if the user isnt finding a course
        allClasses = []
        //have this call a function that reads in students classes from local json file
        //maybe have a backup copy of their schedule saved on firebase incase they delete the app
        //have settings button that says "recover schedule" or something
        studentsClasses = []
        searchResults = []
        todaysClasses = []
        searchText = ""
        searchActive = false
        activeDay = Date()
        
//        studentsClasses = retrieveClasssesLocally(fileName: "student_classes")
        studentsClasses = [
            SingleClass(CRN: 6328674, subject: "CS", number: "275", section: "A", title: "Mobile Development", building: "Cohen", room: "120", days: "MWF", startTime: "8:30", endTime: "9:30", instructor: "Jason", email: "example"),
            SingleClass(CRN: 6328675, subject: "CS", number: "201", section: "A", title: "Operating Systems", building: "Votey", room: "207", days: "MWF", startTime: "12:30", endTime: "13:20", instructor: "Jason", email: "example")
        ]
        
        getTodaysClasses(date: Date())
        //date week init
        fetchCurrentWeek()
//        fetchCurrentDay()
        
    }
    
// ===========================
// MARK: Add Classes functions
// ===========================
    func filterClasses(){
        if searchText.isEmpty {
            searchResults = allClasses
        } else {
            searchResults = allClasses.filter { ("\($0.subject) \($0.number)").lowercased().hasPrefix(searchText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))
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
    func getTodaysClasses(date: Date){
        activeDay = date
        let calendar = Calendar.current
        let currentDay = calendar.component(.weekday, from: date)
        let _ = print("Today is: \(currentDay)")
        
        var dayOfWeek: String = ""
        switch currentDay{
        case 1:
            dayOfWeek = "m"
        case 2:
            dayOfWeek = "m"
        case 3:
            dayOfWeek = "t"
        case 4:
            dayOfWeek = "w"
        case 5:
            dayOfWeek = "r"
        case 6:
            dayOfWeek = "f"
        case 7:
            dayOfWeek = "m"
        default:
            dayOfWeek = "m"
        }
        todaysClasses = []
        for aClass in studentsClasses {
            if (aClass.days.lowercased().contains(dayOfWeek)) {
                todaysClasses.append(aClass)
            }
        }
    }
    func getActiveClassFromBuilding(building: Building){
        for aCourse in todaysClasses{
            //change building.name to the building abbreviation
            if building.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == aCourse.building.lowercased().trimmingCharacters(in: .whitespacesAndNewlines){
                activeClass = aCourse
            }
        }
    }
    //===Changes the height of the class object===
    func getClassShellHeight(course: SingleClass) -> CGFloat{
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "HH:mm"
        let startTime = timeFormat.date(from: course.startTime)
        let endTime = timeFormat.date(from: course.endTime)
        
        let classLength = (endTime!.timeIntervalSince(startTime!))/60 * 5/3
        
        return classLength
    }
    func getOffset(singleClass: SingleClass) -> CGFloat{
        let startTime = singleClass.startTime
        
        //divides into [hours, minutes]
        let rawDivision = startTime.components(separatedBy: ":")
        //since 8 is first time on calendar, minus 8 then multiply by 100 for every hour after since each hour is seperated by 100. We also add 50 because the 8 is 50 points below the top
        let hour = (Double(rawDivision[0])! - 8) * 100 + 50
        print("hour: \(hour)")
        //Here we converts the minutes from in terms of 60(minutes in an hour) to 100(each hour is 100 points in height)
        let minutes = Double(rawDivision[1])! * 5/3
        print("minutes: \(minutes)")
        return hour + minutes
    }
    //===Read from Json file===
    func retrieveClasssesLocally(fileName: String) -> [SingleClass]{
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
            return try decoder.decode([SingleClass].self, from: data)
        } catch {
            print("File is Empty: \(error)")
            return []
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
        
        let fileName = "student_classes"
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: "json")
        else{
            print("Couldn't find \(fileName) in main bundle.")
            return
        }
//        let filePath = self.getDocumentsDirectoryUrl().appendingPathComponent(fileName)
        
        do {
            let data = try encoder.encode(studentsClasses)
            try data.write(to: filePath)
            print(String(data: data, encoding: .utf8)!)
            studentsClasses = retrieveClasssesLocally(fileName: "student_classes")
        } catch {
            fatalError("Cannot save to file:\n\(error)")
        }
        
    }
    func saveClassesToFirebase(){
        
    }
    
    // SCHEDULE STUFF:
    // Data & Time implementation
    
    @Published var currentWeek: [Date] = []
//    @Published var day: DateInterval
    
    func fetchCurrentWeek() {
        
        let today = Date()
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...5).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay){
                currentWeek.append(weekday)
            }
        }
        
        
    }
    
    func fetchCurrentDay() -> String {
        //let today = Date()
        //let calendar = Calendar.current
//        let day = calendar.dateInterval(of: .day, for: today)
        //let day = calendar.date(from: today)
        let f = DateFormatter()

        print(f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1])
        
        return f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
        // from https://stackoverflow.com/questions/41068860/get-weekday-from-date-swift-3
        // return calendar.component(.day, from: today)
    }
    func fetchYesterday() -> String {
        let f = DateFormatter()
        return f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 2]
    }
    func fetchBeforeYesterday() -> String {
        let f = DateFormatter()
        return f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 3]
    }
    func fetchTomorrow() -> String {
        let f = DateFormatter()
        return f.weekdaySymbols[Calendar.current.component(.weekday, from: Date())]
    }
    func fetchAfterTomorrow() -> String {
        let f = DateFormatter()
        return f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) + 1]
    }
    
    // extracting date
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    //source: https://www.youtube.com/watch?v=nKHrsrmA4lM //
    
    
    
    
    
    
}
