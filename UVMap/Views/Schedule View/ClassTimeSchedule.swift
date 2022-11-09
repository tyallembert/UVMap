//
//  ClassTimeSchedule.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//

import SwiftUI

struct ClassTimeSchedule: View {
    
    @EnvironmentObject var singleClass: SingleClass
    
    var body: some View {
        HStack {
            Text("\(singleClass.startTime)-\(singleClass.endTime)")
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
    }
}

struct ClassTimeSchedule_Previews: PreviewProvider {
    static var previews: some View {
        ClassTimeSchedule()
    }
}
