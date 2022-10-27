//
//  AddOneClass.swift
//  UVMap
//
//  Created by Ty Allembert on 10/17/22.
//

import SwiftUI

struct AddOneClass: View {
    @EnvironmentObject var singleClass: SingleClass
    @EnvironmentObject var classManager: ClassManager
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("\(singleClass.subject) \(singleClass.number)-\(singleClass.section)")
                    .font(.system(size: 25, weight: .bold))
                Text("\(singleClass.building)")
                    .font(.system(size: 20, weight: .semibold))
                HStack {
                    Text("\(singleClass.days)")
                        .font(.system(size: 15))
                    Text("\(singleClass.startTime)-\(singleClass.endTime)")
                }
            }
                .padding()
            Spacer()
            Button{
                classManager.removeClass(course: singleClass)
            }label: {
                Image(systemName: "minus.circle")
                    .foregroundColor(.red)
                    .font(.system(size: 25, weight: .semibold))
            }
            .padding()
        }
        .frame(maxWidth: 350)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.backgroundLighter)
                .shadow(color: Color.black, radius: 3, x: 2, y: 3)
        }
    }
}

struct AddOneClass_Previews: PreviewProvider {
    static var previews: some View {
        AddOneClass()
            .environmentObject(ClassManager())
            .environmentObject(SingleClass(CRN: 762345, subject: "Example", number: "201", section: "A", title: "Example Class", building: "Building", room: "120", days: "M/W/F", startTime: "10:30", endTime: "12:30", instructor: "Jason Hibbeler", email: "Example"))
    }
}
