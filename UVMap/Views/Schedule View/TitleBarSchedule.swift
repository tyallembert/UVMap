//
//  TitleBarSchedule.swift
//  UVMap
//
//  Created by nate lalor on 10/13/22.
//

import SwiftUI

struct TitleBarSchedule: View {
    
    var title = "Schedule"
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("Schedule")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                    
                    NavigationLink {
                        AddClassView()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }.padding(30)
                .foregroundColor(.white)
                .font(.largeTitle)
                .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255).opacity(0.8))
            
        }
    }
}

struct TitleBarSchedule_Previews: PreviewProvider {
    static var previews: some View {
        TitleBarSchedule()
    }
}
