//
//  saveButton.swift
//  UVMap
//
//  Created by user227524 on 11/9/22.
//

import Foundation
import SwiftUI

struct saveButton: View {
    @EnvironmentObject var settingsManager: SettingsManager
    @State private var saveMessage = false
    
    var body: some View {
        Button{
            settingsManager.saveSettingsLocally()
            saveMessage = true
        }label: {
            Text("Save")
                .foregroundColor(.white)
                .padding()
        }
        .alert("Setting Preferences Updated", isPresented: $saveMessage, actions: { })
    }
}
