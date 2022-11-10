//
//  saveButton.swift
//  UVMap
//
//  Created by user227524 on 11/9/22.
//

import Foundation
import SwiftUI

struct saveButton: View {
    //@EnvironmentObject var settingsManager: SettingsManager
    
    init(){
        print("Save Button")
    }
    var body: some View {
        Button(action: {SettingsManager().saveSettingsLocally()}){ Text("Save")}
    }
}
