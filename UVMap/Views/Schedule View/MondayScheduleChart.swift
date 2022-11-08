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
                
                // MON / WED / FRI OFFSET PRESETS        (unit of change: 130)
                //              ClassShell().offset(x: 50, y: -350) // 8:30 - 9:20
                //              ClassShell().offset(x: 50, y: -220) // 9:40 - 10:30
                //              ClassShell().offset(x: 50, y: -90) // 10:50 - 11:40
                //              ClassShell().offset(x: 50, y: 40) // 12:00 - 12:50
                //              ClassShell().offset(x: 50, y: 170)  // 1:10 - 2:00
                //              ClassShell().offset(x: 50, y: 300) // 2:20 - 3:10
                
                // TUES / THURS OFFSET PRESENTS    (unit of change: 175)
                ClassShellLarge().offset(x:50, y: -330) // 8:30 - 9:45
                ClassShellLarge().offset(x:50, y: -155) // 10:05 - 11:20
                ClassShellLarge().offset(x:50, y: 20) // 11:40 - 12:55
                ClassShellLarge().offset(x:50, y: 195) // 1:15 - 2:30
                ClassShellLarge().offset(x:50, y: 370) // 2:50 - 4:05
                
                // THESE ^^^^^^^^ CLASSSHELL()S ARE TOO SMALL. Make a bigger version for Tues/thurs classes?
                
                
                
            }       // UP NEXT:
            // MAKE LIST LABELS MORE SPACED OUT
            // SO CLASSES LINE UP BETTER (last one is like a full hour ahead)
            VStack {
                Text("5PM").frame(height: 100)
                Text("6PM").frame(height: 100)
            }
        }
    }
}


struct ScheduleChart_Previews: PreviewProvider {
    static var previews: some View {
        MondayScheduleChart()
    }
}
