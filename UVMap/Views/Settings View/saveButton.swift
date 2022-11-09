//
//  saveButton.swift
//  UVMap
//
//  Created by user227524 on 11/9/22.
//

import Foundation
import SwiftUI

struct Button<Label> where Label : View {
    @EnvironmentObject var settingsManager:
    SettingsManager
    
    var body: some View {
        Button(settingsManager: SettingsManager().saveSettingsLocally() )
    }
}
