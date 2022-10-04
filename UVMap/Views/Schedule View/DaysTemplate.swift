//
//  DaysTemplate.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//


// DaysTemplate will hold the top menu bar for the days of the week, where the user is able to tap the different days of the week and see their weekly schedule

import SwiftUI

struct DaysTemplate: View {
    var body: some View {
        HStack {
            MondayScheduleMenu()
            TuesdayScheduleMenu()
            WednesdayScheduleMenu()
            ThursdayScheduleMenu()
            FridayScheduleMenu()
        }
    }
}

struct DaysTemplate_Previews: PreviewProvider {
    static var previews: some View {
        DaysTemplate()
    }
}
