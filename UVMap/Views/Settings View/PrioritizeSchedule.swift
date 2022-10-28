//
//  PrioritizeSchedule.swift
//  UVMap
//
//  Created by user227524 on 10/11/22.
//

import Foundation
import SwiftUI

struct PrioritizeSchedule: View {
    @State var prioritizeYes: Bool = true
    var body: some View {
        ZStack {
            VStack (){
                ZStack {
                    Capsule()
                        .frame(width:90,height:44)
                        .foregroundColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
                    ZStack{
                        Circle()
                            .frame(width:40, height:40)
                            .foregroundColor(.backgroundLighter)
                            .shadow(color: .black.opacity(0.50), radius: 4, x: 0, y: 0)
                            .offset(x: prioritizeYes ? -25: 25)
                        //image in the circle
                        //Need to switch to text instead of image
                        Text("Yes")
                            .foregroundColor(prioritizeYes ? Color.textGreenWhite: .white)
                            .offset(x: -25)
                        // image outside of the circle
                        //Need to switch to text instead of image
                        Text("No")
                            .foregroundColor(prioritizeYes ? .white: Color.textGreenWhite)
                            .offset(x: 25)
                    }
                }
                .onTapGesture {
                    self.prioritizeYes.toggle()
                }
            }
        }
        .animation(.default)
    }
}

struct PrioritizeSchedule_Previews: PreviewProvider {
    static var previews: some View {
        PrioritizeSchedule()
            //.environment(\.colorScheme, .dark)
    }
}
