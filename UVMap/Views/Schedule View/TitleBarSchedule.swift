//
//  TitleBarSchedule.swift
//  UVMap
//
//  Created by nate lalor on 10/13/22.
//

import SwiftUI

struct TitleBarSchedule: View {
    
   @State var title = "Schedule"
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                HStack{
                    Text("Schedule").frame(height: 40)
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
    
            }.padding(20)
                .foregroundColor(.white)
                .frame(height: 100)
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
