//
//  ThemePicker.swift
//  UVMap
//
//  Created by user227524 on 10/13/22.
//

import Foundation
import SwiftUI

struct ThemePicker: View{
    @EnvironmentObject var settingsManager:
    SettingsManager
    
    var body: some View {
        VStack {
            Picker(selection: $settingsManager.currentSettings.settingsTheme, label: Text("Theme")) {
                Text("System Default").tag(1)
                Text("Dark Mode").tag(2)
                Text("Light Mode").tag(3)
            }
            .font(.system(size: 15))
            .accentColor(.white)
            .padding(7)
            .frame(width: 180)
            .scaleEffect(0.9)
        }
        .background(Color.backgroundGreen)
        .cornerRadius(25)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker()
            .environmentObject(SettingsManager())
    }
}
