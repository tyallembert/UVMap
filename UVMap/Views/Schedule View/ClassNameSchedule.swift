//
//  ClassShell.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//

import SwiftUI

struct ClassNameSchedule: View {
    
    var className: String = "CS 275"
    
    var body: some View {
        HStack {
            Text(className)
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
