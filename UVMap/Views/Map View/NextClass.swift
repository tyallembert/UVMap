//
//  NextClass.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct NextClass: View {
    @State var className: String = "CS 275"
    
    var body: some View {
        HStack {
            Text("Next Class: ")
            Text(className)
                .fontWeight(.heavy)
        }
    }
}

struct NextClass_Previews: PreviewProvider {
    static var previews: some View {
        NextClass()
    }
}
