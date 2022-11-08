//
//  ClassTimeSchedule.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//

import SwiftUI

struct ClassTimeSchedule: View {
    
    @State var classTime: String = "8:30am - 9:45am"
    
    var body: some View {
        HStack {
            Text(classTime)
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
