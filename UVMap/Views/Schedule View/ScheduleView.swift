//
//  ScheduleView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/24/22.
//


// ScheduleView is the main view for the user's schedule. It will hold DaysTemplate at the top, which has the days of the week menu, and below that will hold ScheduleChart, which presents the data


import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var classManager: ClassManager
    
    var body: some View {
        VStack {
            TitleBarSchedule().border(.red)
            DaysTemplate()
            MondayScheduleChart()
            
            Spacer()
            HStack{
                Text("")
            }
            
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
            .environmentObject(ClassManager())
    }
}
