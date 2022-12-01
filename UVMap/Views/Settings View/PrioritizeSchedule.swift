//
//  PrioritizeSchedule.swift
//  UVMap
//
//  Created by user227524 on 10/11/22.
//

import Foundation
import SwiftUI

struct PrioritizeSchedule: View {
    @EnvironmentObject var settingsManager: SettingsManager
    var body: some View {
        ZStack {
            VStack (){
                ZStack {
                    Capsule(style: .continuous)
                        .frame(width:90,height:44)
                        .foregroundColor(Color.backgroundGreen)
                    ZStack{
                        Circle()
                            //.strokeBorder(.black.opacity(0.50))
                            .frame(width:40, height:40)
                            .foregroundColor(Color.backgroundLighter)
                            .shadow(color: .black.opacity(0.50), radius: 4, x: 0, y: 0)
                            .overlay{
                                Circle()
                                    .stroke(Color.textBlackWhite)
                            }
                            .offset(x: settingsManager.currentSettings.prioritizeSchedule ? -25: 25)
                            
                            
                        
                        //image in the circle
                        //Need to switch to text instead of image
                        Text("Yes")
                            .foregroundColor(settingsManager.currentSettings.prioritizeSchedule ? .white: Color.textGreenWhite)
                            .offset(x: 25)
                        // image outside of the circle
                        //Need to switch to text instead of image
                        Text("No")
                            .foregroundColor(settingsManager.currentSettings.prioritizeSchedule ? Color.textGreenWhite: .white)
                            .offset(x: -25)
                    }
                }
                .onTapGesture {
                    withAnimation{
                        self.settingsManager.currentSettings.prioritizeSchedule.toggle()
                    }
                }
            }
        }
        .animation(.default)
    }
}

struct PrioritizeSchedule_Previews: PreviewProvider {
    static var previews: some View {
        PrioritizeSchedule()
            .environmentObject(SettingsManager())
            //.environment(\.colorScheme, .dark)
    }
}
