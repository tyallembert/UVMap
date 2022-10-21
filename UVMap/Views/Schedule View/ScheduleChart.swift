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
        
        HStack {
            //ZStack{
                List {
                    Text("8AM").frame(height: 70)
                    ClassShell()
                    Text("9AM").frame(height: 70)
                    Text("10AM").frame(height: 70)
                    Text("11AM").frame(height: 70)
                    Text("12PM").frame(height: 70)
                    Text("1PM").frame(height: 70)
                    Text("2PM").frame(height: 70)
                    Text("3PM").frame(height: 70)
                    Text("4PM").frame(height: 70)
                    

                }.frame(height: 550)
                    .border(.black.opacity(0.8))
                    .shadow(color: .black.opacity(0.1), radius: 3, y: -3)
                    .padding()
                    .offset(y:-55)
            }
            
        //}
        
        
    }
    
}


struct ScheduleChart_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleChart()
    }
}
