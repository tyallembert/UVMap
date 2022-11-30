//
//  NextClass.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct NextClass: View {
    @EnvironmentObject var classManager: ClassManager
//    @Binding var building: Building
    
    var body: some View {
        HStack {
            Text("Class: ")
//            Text("\(classManager.activeClass?.title)")
            if let active = classManager.activeClass {
                let title = active.title
                Text(title)
                    .fontWeight(.heavy)
            } else {
                Text("No active class")
                    .fontWeight(.heavy)
            }
            
        }
    }
}

//struct NextClass_Previews: PreviewProvider {
//    static var previews: some View {
//        NextClass()
//    }
//}
