//
//  MondayScheduleMenu.swift
//  UVMap
//
//  Created by nate lalor on 10/4/22.
//

import SwiftUI

struct MondayScheduleMenu: View {
    var body: some View {
        VStack {
            VStack{
                Text("M").frame(height: 50, alignment: .top)
            }
            
        }.padding()
            .frame(width: 52, height: 60)
            .background(Color("AccentColor"))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.3), radius: 3, y: -5)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(.black).opacity(0.5))
                    )
                
                }
            }
                
                struct MondayScheduleMenu_Previews: PreviewProvider {
                    static var previews: some View {
                        MondayScheduleMenu()
                    }
                }

//(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255).opacity(1)), lineWidth: 3)
