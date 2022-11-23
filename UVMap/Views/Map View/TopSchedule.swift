//
//  topSchedule.swift
//  UVMap
//
//  Created by Ty Allembert on 10/28/22.
//

import SwiftUI

struct TopSchedule: View {
    @EnvironmentObject var classManager: ClassManager
    @EnvironmentObject var mapManager: MapManager
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Todays Schedule:")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color.textGreenWhite)
                .offset(x: 20, y: 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(classManager.todaysClasses, id: \.self.CRN) { course in
                        Spacer()
                        Button{
                            mapManager.setActiveBuilding(building: mapManager.getBuildingFromString(buildingString: course.building))
                        }label: {
                            HStack(alignment: .center) {
                                Text(course.subject)
                                    .font(.system(size: 17, weight: .semibold))
                                Text(course.number)
                                    .font(.system(size: 17, weight: .semibold))
                                Text(course.startTime)
                                    .font(.system(size: 13))
                            }
                            .padding(7)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.backgroundLighter)
                                    .shadow(color: .black.opacity(0.7), radius: 2)
                            }
                        }
                        Spacer()
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

struct TopSchedule_Previews: PreviewProvider {
    static var previews: some View {
        TopSchedule()
            .environmentObject(ClassManager())
            .environmentObject(MapManager())
    }
}
