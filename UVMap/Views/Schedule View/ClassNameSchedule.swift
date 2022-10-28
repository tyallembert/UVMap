//
//  ClassShell.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//

import SwiftUI

struct ClassNameSchedule: View {
    
    var className: String = "CS 275"
//    Lecture l1(name: "CS 275",
//               time: "8:30am - 9:20am",
//               professor: "Jason Hibbeler",
//               building: "Cohen 120")
    
        

    var body: some View {
        HStack {
            Text(className) // replace this with l1.getName?
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
    }
}

struct ClassNameSchedule_Previews: PreviewProvider {
    static var previews: some View {
        ClassNameSchedule()
    }
}
