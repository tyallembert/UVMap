//
//  ClassTime.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct ClassTime: View {
    @EnvironmentObject var classManager: ClassManager
    @State var startTime: String = "8:30 AM"
    
    var body: some View {
        HStack {
            Text("Start Time: ")
            if let active = classManager.activeClass{
                let newStartTime = active.startTime
                Text(newStartTime)
                    .fontWeight(.heavy)
            } else {
                Text("No active class")
                    .fontWeight(.heavy)
            }
        }
    }
}

struct ClassTime_Previews: PreviewProvider {
    static var previews: some View {
        ClassTime()
    }
}
