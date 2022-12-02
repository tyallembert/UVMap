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
                    Capsule()
                        .frame(width:100,height:44)
                        .foregroundColor(Color.backgroundGreen)
                    ZStack{
                        Circle()
                            .frame(width:45, height:45)
                            .foregroundColor(.backgroundLighter)
                            .shadow(color: .black.opacity(0.50), radius: 4, x: 0, y: 0)
                            .overlay{
                                Circle()
                                    .stroke(Color.textBlackWhite)
                            }
                            .offset(x: settingsManager.currentSettings.prioritizeSchedule ? -25: 25)
                            
                            
                        
                        //image in the circle
                        //Need to switch to text instead of image
                        Text("Yes")
                            .font(.system(size: 15))
                            .foregroundColor(settingsManager.currentSettings.prioritizeSchedule ? Color.textGreenWhite: .white)
                            .offset(x: settingsManager.currentSettings.prioritizeSchedule ? -28: -25)
                        // image outside of the circle
                        //Need to switch to text instead of image
                        Text("No")
                            .font(.system(size: 15))
                            .foregroundColor(settingsManager.currentSettings.prioritizeSchedule ? .white: Color.textGreenWhite)
                            .offset(x: !settingsManager.currentSettings.prioritizeSchedule ? 28: 25)
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
            .environmentObject(SettingsManager())
    }
}
