//
//  ClassTime.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct ClassTime: View {
    @State var startTime: String = "8:30 AM"
    
    var body: some View {
        HStack {
            Text("Start Time: ")
            Text(startTime)
                .fontWeight(.heavy)
        }
    }
}

struct ClassTime_Previews: PreviewProvider {
    static var previews: some View {
        ClassTime()
    }
}
