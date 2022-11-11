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
                        Spacer().frame(width: 1)
                        Button{
                            classManager.getTodaysClasses(date: day)
                        }label: {
                            VStack {
                                Text(classManager.extractDate(date: day, format: "dd"))
                                Text(classManager.extractDate(date: day, format: "EEE"))
                            }
                            .padding(5)
                            .background(classManager.activeDay == day ? Color.backgroundGreen :Color.white)
                            .foregroundColor(classManager.activeDay == day ? Color.white :Color.backgroundGreen)
                            .cornerRadius(5)
                        }
                        Spacer().frame(width: 1)
                    }

                }
            }
            
            .padding()

            .frame(width: geometry.size.width)
        }
    }
}

struct DaysTemplate_Previews: PreviewProvider {
    static var previews: some View {
        DaysTemplate()
            .environmentObject(ClassManager())
    }
}
