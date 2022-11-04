//
//  topSchedule.swift
//  UVMap
//
//  Created by Ty Allembert on 10/28/22.
//

import SwiftUI

struct TopSchedule: View {
    @EnvironmentObject var classManager: ClassManager
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                // MARK: this loop is just for testing(below)
                
                ForEach((1...5), id: \.self) { course in
                    Spacer()
                    HStack(alignment: .center) {
                        Text("Cohen")
                            .font(.system(size: 17, weight: .semibold))
                        Text("8:30")
                            .font(.system(size: 13))
                    }
                    .padding(7)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.backgroundLighter)
                            .shadow(color: .black.opacity(0.7), radius: 2)
                    }
                    Spacer()
                }
//                ForEach(classManager.todaysClasses, id: \.self.CRN) { course in
//                    Spacer()
//                    Button{
//                        //set the route to this building
//                    }label: {
//                        HStack(alignment: .center) {
//                            Text(course.building)
//                                .font(.system(size: 17, weight: .semibold))
//                            Text(course.startTime)
//                                .font(.system(size: 13))
//                        }
//                        .padding(7)
//                        .background{
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.backgroundLighter)
//                                .shadow(color: .black.opacity(0.7), radius: 2)
//                        }
//                    }
//                    Spacer()
//                }
            }
            .padding(.vertical)
        }
    }
}

struct TopSchedule_Previews: PreviewProvider {
    static var previews: some View {
        TopSchedule()
            .environmentObject(ClassManager())
    }
}
