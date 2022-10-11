//
//  SettingsView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/24/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var databaseManager: DatabaseManager
    
    var body: some View {
        VStack {
            Text("Settings View")
            Button{
                databaseManager.writeBuildings()
            }label:{
                Text("Save Buildings")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
