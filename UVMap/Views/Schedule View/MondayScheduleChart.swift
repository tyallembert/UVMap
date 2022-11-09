//
//  ScheduleChart.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//


// ScheduleChart is made to be the graphics for the time slots, and also will hold all of the ClassShell items in it.


// Based off size of ClassShell, this should be a list, where the user can scroll through the hours of the day and see the corresponding classes and when

import SwiftUI

struct MondayScheduleChart: View {
    @EnvironmentObject var classManager: ClassManager
    var times = ["8AM", "9AM", "10AM", "11AM","12PM", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM"]
    var body: some View {
        List {
            ZStack(alignment: .leading) {
                VStack {
                    ForEach(times, id: \.self){ time in
                        Text(time).frame(height: 100)
                    }
                }
                
                VStack{
                    ZStack {
                        ForEach(classManager.todaysClasses, id: \.self.CRN) { course in
                                ClassShell()
                                    .environmentObject(classManager)
                                    .environmentObject(course)
                                    .frame(alignment: .topTrailing)
                                    .offset(y: classManager.getOffset(singleClass: course))
                        }
                    }
                    Spacer()
                }
                .frame(maxHeight: .infinity)
                
            }
            // MAKE LIST LABELS MORE SPACED OUT
            // SO CLASSES LINE UP BETTER (last one is like a full hour ahead)
        }
    }
}


struct ScheduleChart_Previews: PreviewProvider {
    static var previews: some View {
        MondayScheduleChart()
            .environmentObject(ClassManager())
    }
}
