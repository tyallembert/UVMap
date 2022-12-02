//
//  ArriveShell.swift
//  UVMap
//
//  Created by user227524 on 10/12/22.
//

import Foundation
import SwiftUI

struct ArriveShell: View {
    @EnvironmentObject var settingsManager: SettingsManager
    //@State var howEarly: Int = settingsManager.settings[0].howEarly
    var body: some View {
        HStack(spacing: 10){
            //arrive text
            Text("Arrive")
                .foregroundColor(.white)
            HowEarlyDropDown()
                .environmentObject(settingsManager)
            Text("min before class")
                .foregroundColor(.white)
            //before class starts text
        }
        .font(.system(size: 15, weight: .medium))
            .padding(20)
            .frame(height: 40)
            .background{
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.backgroundGreen)
                    .shadow(color: Color.black.opacity(0.5), radius: 3, y: 5)
                    .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: Color.innerShadow, lineWidth: 1, offsetX: 2, offsetY: 1, blur: 2, blendMode: .overlay, opacity: 0.8)
            }
    }
}

struct ArriveShell_Previews: PreviewProvider {
    static var previews: some View {
        ArriveShell()
            .environmentObject(SettingsManager())
    }
}
