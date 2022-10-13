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
            TitleBar()
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 10){
                Text("How early do you like to arrive to class?")
                    .font(.title3)
                    
                ArriveShell()
            }
            VStack(alignment: .leading, spacing: 10){
                Text("Prioritize Schedule?")
                    .font(.title3)
                PrioritizeSchedule()
            }
            Spacer()
            HStack {
                Text("")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
