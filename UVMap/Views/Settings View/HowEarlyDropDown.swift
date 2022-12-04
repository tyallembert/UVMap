//
//  HowEarlyDropDown.swift
//  UVMap
//
//  Created by user227524 on 10/11/22.
//

import SwiftUI

// the view for the drop down menu for how early you'd like to arrive to class
struct HowEarlyDropDown: View {
    @EnvironmentObject var settingsManager: SettingsManager
    
    
    var body: some View {
        VStack {
            Picker(selection: $settingsManager.currentSettings.howEarly)
            {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
                Text("10").tag(10)
                Text("15").tag(15)
                Text("20").tag(20)
                Text("25").tag(25)
                Text("30").tag(30)
            }label: {
                Text("How early do you want to arrive to class?")
            }
        }
            .padding()
            .scaleEffect(0.9)
            .frame(width: 92, height: 40)
            .background(Color.backgroundLighter)
            .accentColor(Color.textGreenWhite)
//            .frame(width:150, height: 30)
    }
}

struct HowEarlyDropDown_Previews: PreviewProvider {
    static var previews: some View {
        HowEarlyDropDown()//.environment(\.colorScheme, .dark)
            .environmentObject(SettingsManager())
    }
}
