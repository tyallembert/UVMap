//
//  ClassProfessorSchedule.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//

import SwiftUI

struct ClassProfessorSchedule: View {
    
    @Binding var classProfessor: String
    
    var body: some View {
        
        HStack {
            Text(classProfessor)
                .fontWeight(.light)
                .foregroundColor(.white)
        }
    }
}

//struct ClassProfessorSchedule_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassProfessorSchedule()
//    }
//}
