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
                Spacer()
                    .frame(width: 15)
                Text("Schedule")
                    .padding(.bottom, 8)
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .bold))
                    .shadow(radius: 5, x: 5, y: 10)
                Spacer()
                
                NavigationLink {
                    AddClassView()
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .font(.system(size: 22, weight: .semibold))
                }
                Spacer()
                    .frame(width: 15)
                
            }
            
        }
        .foregroundColor(.white)
        .background(Color.backgroundGreen)
    }
}

struct TitleBarSchedule_Previews: PreviewProvider {
    static var previews: some View {
        TitleBarSchedule()
    }
}
