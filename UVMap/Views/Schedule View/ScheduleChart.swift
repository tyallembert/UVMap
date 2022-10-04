//
//  ScheduleChart.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//


// ScheduleChart is made to be the graphics for the time slots, and also will hold all of the ClassShell items in it.


// Based off size of ClassShell, this should be a list, where the user can scroll through the hours of the day and see the corresponding classes and when

import SwiftUI

struct ScheduleChart: View {
    var body: some View {
        VStack {
            Text("Schedule Chart Here")
            ClassShell()
        }
        
    }
}

struct ScheduleChart_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleChart()
    }
}
