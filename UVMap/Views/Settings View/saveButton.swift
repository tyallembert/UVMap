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
    
    var body: some View {
        Button{
            settingsManager.saveSettingsLocally()
            
        }label: {
            Text("Save")
                .foregroundColor(.white)
                .padding()
        }
    }
}
