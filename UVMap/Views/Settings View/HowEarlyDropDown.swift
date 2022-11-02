//
//  HowEarlyDropDown.swift
//  UVMap
//
//  Created by user227524 on 10/11/22.
//

import SwiftUI

struct HowEarlyDropDown: View {
    @EnvironmentObject var settingsManager: SettingsManager
    
    @Binding var howEarly: Int
    
    var body: some View {
        VStack {
            Picker(selection: $howEarly, label: Text("How early do you want to arrive to class?")) {
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
            }
        }.padding()
            .background(Color.backgroundLighter)
            .accentColor(Color.textGreenWhite)
            .frame(width:150, height: 50)
            
    }
}

struct HowEarlyDropDown_Previews: PreviewProvider {
    static var previews: some View {
        HowEarlyDropDown(howEarly: .constant(10))//.environment(\.colorScheme, .dark)
    }
}
