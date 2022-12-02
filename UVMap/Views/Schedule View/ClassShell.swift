//
//  ClassShell.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//

// //////////////////////////////////////////////// //
// THIS IS A CLASS SHELL MEANT FOR: Mon/Wed/Fri CLASSES (50 minute classes) //
// //////////////////////////////////////////////// //

import SwiftUI

struct ClassShell: View {
    @EnvironmentObject var classManager: ClassManager
    @EnvironmentObject var singleClass: SingleClass
    var body: some View {
        HStack(alignment: .top){
            //LHS
            VStack(alignment: .leading) {
                ClassNameSchedule(className: $singleClass.title)
                ClassTimeSchedule()
                    .environmentObject(singleClass)
                ClassProfessorSchedule(classProfessor: $singleClass.instructor)
                
            }
            .fixedSize(horizontal: false, vertical: true)
            //Spacer()
            
            //RHS
            ClassBuildingSchedule()
                .fixedSize(horizontal: false, vertical: true)
                .environmentObject(singleClass)
                .frame(width: 95)
                
        //Green styling on HStack
        }
        //.fixedSize(horizontal: false, vertical: true)
        .padding()
        .frame( height: classManager.getClassShellHeight(course: singleClass))
        .background(Color.backgroundGreen.opacity(0.8))
        .cornerRadius(25)
    }
}

struct ClassShell_Previews: PreviewProvider {
    static var previews: some View {
        ClassShell()
            .environmentObject(ClassManager())
    }
}
