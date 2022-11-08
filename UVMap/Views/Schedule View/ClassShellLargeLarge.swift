//
//  ClassShellLarge.swift
//  UVMap
//
//  Created by nate lalor on 11/3/22.
//

// //////////////////////////////////////////////// //
// THIS IS A CLASS SHELL MEANT FOR: 3 HOUR CLASSES  //
// //////////////////////////////////////////////// //
import SwiftUI

struct ClassShellLargeLarge: View {
    var body: some View {
        HStack{
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
        .frame(width: 300, height: 220)
        .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255).opacity(0.8))
        .cornerRadius(25)
        
        
    }
}

struct ClassShellLargeLarge_Previews: PreviewProvider {
    static var previews: some View {
        ClassShellLargeLarge()
    }
}
