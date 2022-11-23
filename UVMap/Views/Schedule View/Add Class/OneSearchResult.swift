//
//  OneSearchResult.swift
//  UVMap
//
//  Created by Ty Allembert on 10/18/22.
//

import SwiftUI

struct OneSearchResult: View {
    @EnvironmentObject var singleClass: SingleClass
    @EnvironmentObject var classManager: ClassManager
    var body: some View {
        HStack {
            Text("\(singleClass.subject) \(singleClass.number)- \(singleClass.section)")
                .font(.system(size: 20, weight: .semibold))
            Spacer()
            Text(singleClass.days)
            Text("\(singleClass.startTime)-\(singleClass.endTime)")
            if classManager.studentsClasses.contains(where: {$0.CRN == singleClass.CRN}) {
                Button{
                    classManager.removeClass(course: singleClass)
                }label: {
                    Image(systemName: "minus.circle")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.red)
                }
            }else{
                Button{
                    classManager.addClass(course: singleClass)
                }label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
    }
}

struct OneSearchResult_Previews: PreviewProvider {
    static var previews: some View {
        OneSearchResult()
//            .environmentObject(SingleClass(CRN: "235425", building: "Cohen", course: "CS 275", title: "Mobile Development", days: "T/Th", startTime: "10:05", endTime: "11:20", room: "Cohen 120", section: "A"))
    }
}
