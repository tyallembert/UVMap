//
//  ClassBuildingSchedule.swift
//  UVMap
//
//  Created by nate lalor on 10/4/22.
//

import SwiftUI

struct ClassBuildingSchedule: View {
    
    @EnvironmentObject var singleClass: SingleClass
    
    var body: some View {
        VStack {
            Text(singleClass.building)
            Text(singleClass.room)
        }
        .font(.system(size: 25, weight: .heavy))
        .foregroundColor(.white)
    }
}

struct ClassBuildingSchedule_Previews: PreviewProvider {
    static var previews: some View {
        ClassBuildingSchedule()
//            .environmentObject(SingleClass(from: <#Decoder#>))
    }
}
