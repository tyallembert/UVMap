//
//  SettingsView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/24/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    @EnvironmentObject var sessionManager: SessionManager
    var body: some View {
        ZStack(alignment: .trailing){
            
            VStack{
                TitleBar()
//                    .padding(.top)
                    .frame(height: 150)
                    .edgesIgnoringSafeArea(.top)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("How early do you like to arrive to class?")
                            .font(.title3)
                        
                        ArriveShell()
                            .environmentObject(settingsManager)
                    }
                    VStack(alignment: .leading, spacing: 10){
                        Text("Prioritize Schedule?")
                            .font(.title3)
                        PrioritizeSchedule()
                            .environmentObject(settingsManager)
                    }
                    VStack(alignment: .leading, spacing: 10){
                        Text("Theme")
                            .font(.title3)
                        ThemePicker()
                            .environmentObject(settingsManager)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        PullFirebaseButton()
                            .environmentObject(sessionManager)
                    }
                    VStack(alignment: .leading, spacing: 20) {
                        SignOutButton()
                            .environmentObject(sessionManager)
                    }
                    Spacer()
                    
                }.padding(.leading)
                    .padding(.trailing)
            }
            
        }
        .background(Color.backgroundLighter)
        }
    }


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environment(\.colorScheme, .dark)
            .environmentObject(SettingsManager())
            .environmentObject(SessionManager())
    }
}
