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
                }
                ClassShell().offset(x: 50, y: -350) // 8:30 - 9:20
                ClassShell().offset(x: 50, y: -200) // 9:40 - 10:30
                ClassShell().offset(x: 50, y: -140) // 10:50 - 11:40
                ClassShell().offset(x: 50, y: -35) // 12:00 - 12:50
                ClassShell().offset(x: 50, y: 70)  // 1:10 - 2:00
                ClassShell().offset(x: 50, y: 175) // 2:20 - 3:10
                
                
                
                
                
                
                
                
                
                // PRESETS:
                // 8:30am - (x: 50, y: -260)
                // 9:40am - (x: 50, y: -155)
                // 10:50am - (x: 50, y: -50)
                // 12:00pm - (x: 50, y: 55)
                // 1:10pm - (x: 50, y: 160)
                // 2:20pm - (x: 50, y: 265)
            }       // UP NEXT:
                        // MAKE LIST LABELS MORE SPACED OUT
                        // SO CLASSES LINE UP BETTER (last one is like a full hour ahead)
        }
    }
}


struct ScheduleChart_Previews: PreviewProvider {
    static var previews: some View {
        MondayScheduleChart()
    }
}
