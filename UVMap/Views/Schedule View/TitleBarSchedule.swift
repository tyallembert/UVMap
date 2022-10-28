//
//  TitleBarSchedule.swift
//  UVMap
//
//  Created by nate lalor on 10/13/22.
//

import SwiftUI

struct TitleBarSchedule: View {
    var body: some View {
        VStack{
            HStack{
                Text("Schedule")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                Spacer()
                Button("+") {
                    // LINK TO ADD CLASS PAGE HERE
                    // do we want this as navigation
                    // instead of button?
                }.padding(30)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255).opacity(0.8))
        }
    }
}

struct TitleBarSchedule_Previews: PreviewProvider {
    static var previews: some View {
        TitleBarSchedule()
    }
}
