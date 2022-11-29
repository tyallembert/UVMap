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
        HStack(spacing: 0){
            //arrive text
            Text("Arrive")
                .foregroundColor(.white)
                .font(.body)
            HowEarlyDropDown()
                .environmentObject(settingsManager)
            Text("min before class")
                .foregroundColor(.white)
                .font(.body)
            //before class starts text
        }.padding()
            .frame(width: 375, height: 50, alignment: .leading)
            .background(Color("AccentColor"))
            .cornerRadius(50)
    }
}

//struct ArriveShell_Previews: PreviewProvider {
//    static var previews: some View {
//        ArriveShell(howEarly: )
//    }
//}
