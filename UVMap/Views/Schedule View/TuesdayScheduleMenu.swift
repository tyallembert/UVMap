//
//  TuesdayScheduleMenu.swift
//  UVMap
//
//  Created by nate lalor on 10/4/22.
//

import SwiftUI

struct TuesdayScheduleMenu: View {
    var body: some View {
        VStack {
            Text("T").frame(height: 50, alignment: .top)
        }.padding()
            .frame(width: 52, height: 60)
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.3), radius: 3, y: -5)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(.black))
                    )
                
    }
}

struct TuesdayScheduleMenu_Previews: PreviewProvider {
    static var previews: some View {
        TuesdayScheduleMenu()
    }
}
