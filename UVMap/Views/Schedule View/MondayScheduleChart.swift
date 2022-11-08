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
    var body: some View {
        List {
            ZStack(alignment: .leading) {
                VStack {
                    Text("8AM").frame(height: 100)
                    Text("9AM").frame(height: 100)
                    Text("10AM").frame(height: 100)
                    Text("11AM").frame(height: 100)
                    Text("12PM").frame(height: 100)
                    Text("1PM").frame(height: 100)
                    Text("2PM").frame(height: 100)
                    Text("3PM").frame(height: 100)
                    Text("4PM").frame(height: 100)
                    Text("5PM").frame(height: 100)
                }
                
                VStack{
                    ForEach(classManager.todaysClasses, id: \.self.CRN) { course in
                            ClassShell()
                                .environmentObject(classManager)
                                .environmentObject(course)
                                .frame(alignment: .topTrailing)
                                .offset(y: classManager.getOffset(singleClass: course))
                    }
                    Spacer()
                }
                .frame(maxHeight: .infinity)
                
            }
            .border(.red)
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
