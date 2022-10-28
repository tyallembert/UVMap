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
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(classManager.currentWeek,id: \.self){day in
                        
                        VStack {
                            // MAKE THESE ALL BUTTONS TO SEPARATE LIST FILES
                            //"MondayChart" "TuesdayChart", ..........
                            
                            // they all will be styled the same exactly but will have different classes pulled from ClassManager
                            Text(classManager.extractDate(date: day, format: "dd"))
                            Text(classManager.extractDate(date: day, format: "EEE"))
                        }
                    }
                    
                    
                    


                }
                .padding()
                .frame(width: geometry.size.width/*, height: geometry.size.height*/)
            }
        }

//        HStack {
//            MondayScheduleMenu()
//            TuesdayScheduleMenu()
//            WednesdayScheduleMenu()
//            ThursdayScheduleMenu()
//            FridayScheduleMenu()
//        }.frame(width: 300)
    }
}

struct DaysTemplate_Previews: PreviewProvider {
    static var previews: some View {
        DaysTemplate()
            .environmentObject(ClassManager())
    }
}
