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
            VStack{
                Spacer()
                HStack{
                    Text("Schedule")
                        .frame(height: 40)
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
    
            }
            .padding()
                .foregroundColor(.white)
                .background(Color.backgroundGreen)
    }
}

struct TitleBarSchedule_Previews: PreviewProvider {
    static var previews: some View {
        TitleBarSchedule()
    }
}
