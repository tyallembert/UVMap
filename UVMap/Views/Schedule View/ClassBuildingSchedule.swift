//
//  ClassBuildingSchedule.swift
//  UVMap
//
//  Created by nate lalor on 10/4/22.
//

import SwiftUI

struct ClassBuildingSchedule: View {
    
    @State var classroom: String = "Cohen 120"
    
    var body: some View {
        Text(classroom)
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.white)
    }
}

struct ClassBuildingSchedule_Previews: PreviewProvider {
    static var previews: some View {
        ClassBuildingSchedule()
    }
}
