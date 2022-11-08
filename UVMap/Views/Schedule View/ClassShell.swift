//
//  ClassShell.swift
//  UVMap
//
//  Created by nate lalor on 10/2/22.
//

import SwiftUI

struct ClassShell: View {
    @EnvironmentObject var classManager: ClassManager
    @EnvironmentObject var singleClass: SingleClass
    var body: some View {
        HStack(alignment: .top){
            //LHS
            VStack(alignment: .leading) {
                ClassNameSchedule()
                ClassTimeSchedule()
                ClassProfessorSchedule()
                
            }
            Spacer()
            
            //RHS
            ClassBuildingSchedule().frame(width: 120)
                
        //Green styling on HStack
        }.padding()
            .frame(width: 300, height: classManager.getClassShellHeight(course: singleClass))
        .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255).opacity(0.8))
        .cornerRadius(25)
        Spacer()
        
    }
}

struct ClassShell_Previews: PreviewProvider {
    static var previews: some View {
        ClassShell()
            .environmentObject(ClassManager())
    }
}
