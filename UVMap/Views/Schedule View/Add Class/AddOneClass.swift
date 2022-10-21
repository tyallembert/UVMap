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
                Text("\(singleClass.course)-\(singleClass.section)")
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
                .fill(.white)
                .shadow(color: Color.black, radius: 3, x: 2, y: 3)
        }
    }
}

struct AddOneClass_Previews: PreviewProvider {
    static var previews: some View {
        AddOneClass()
            .environmentObject(ClassManager())
    }
}
