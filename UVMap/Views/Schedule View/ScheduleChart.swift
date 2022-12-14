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
    @EnvironmentObject var classManager: ClassManager
    var times = ["8AM", "9AM", "10AM", "11AM","12PM", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM", "7PM", "8PM", "9PM", "10PM"]
    var body: some View {
        ScrollView {
            ZStack(alignment: .trailing) {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(times, id: \.self){ time in
                        ZStack(alignment: .leading) {
                            Divider()
                            Text(time)
                                .frame(height: 100)
                        }
                    }
                }
                
                VStack{
                    ZStack {
                        ForEach(classManager.todaysClasses, id: \.self.CRN) { course in
                                ClassShell()
                                    .environmentObject(classManager)
                                    .environmentObject(course)
                                    .frame(alignment: .top)
                                    .offset(y: classManager.getOffset(singleClass: course))
                        }
                    }
                    Spacer()
                }
                .frame(width: 280, alignment: .leading)
                
            }
            .frame(maxWidth: 350, alignment: .center)
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.backgroundGradient)
                    .shadow(radius: 5)
            }
            .padding()
        }
        .padding(0)
    }
}


struct ScheduleChart_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleChart()
            .environmentObject(ClassManager())
    }
}
