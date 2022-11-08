//
//  DaysTemplate.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//


// DaysTemplate will hold the top menu bar for the days of the week, where the user is able to tap the different days of the week and see their weekly schedule

import SwiftUI

struct DaysTemplate: View {
    @EnvironmentObject var classManager: ClassManager
    //@State var dayButton: String = classManager.extractDate(date: day, format: "EEE")
    // is this published??? or what?
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(classManager.currentWeek,id: \.self){day in
                        VStack {
                            Text(classManager.extractDate(date: day, format: "dd"))
                            Text(classManager.extractDate(date: day, format: "EEE"))
                        }
                    }
                    //
                    // for help in switch, look at:
                        // MAIN NAVIATION and MAIN MENU BAR (or whatever file is with main navigation)
                    
//
//                    switch dayButton {
//                          case "Mon":
//                             LINK TO MONDAY
//                          case "Tue":
//                             LINK TO TUESDAY
//                          case "Wed":
//                              LINK TO WEDNESDAY
//                          case "Thu":
//                              LINK TO THURSDAY
//                          case "FRI:
//                              LINK TO FRIDAY
////                    }
                    
                    
                    // MONDAY BUTTON
//                    Button {
//                        MondayScheduleChart()
//                    } label: {
//                        Text(classManager.fetchBeforeYesterday())
//                    }
                    
                    // TUESDAY BUTTON

                    
                    // WEDNESDAY BUTTON
                    
                    
                    // THURSDAY BUTTON
                    
                    
                    // FRIDAY BUTTON
//
//
//
//                    Text(classManager.fetchYesterday())
//                    Text(classManager.fetchCurrentDay())
//                    Text(classManager.fetchTomorrow())
//                    Text(classManager.fetchAfterTomorrow())
//
//
                    
                    
                }
            }
            
            .padding()
            .frame(width: geometry.size.width, height: 100)
        }//geometry reader end
    }
}

struct DaysTemplate_Previews: PreviewProvider {
    static var previews: some View {
        DaysTemplate()
            .environmentObject(ClassManager())
    }
}
