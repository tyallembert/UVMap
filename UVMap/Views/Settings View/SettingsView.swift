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
            VStack{
                TitleBar()
                    .frame(height: 120)
                
                ScrollView {
                    settingsUserInfo()
                        .padding(20)
                        .frame(alignment: .center)
                        .environmentObject(sessionManager)
                        .zIndex(1)
                    
                    VStack(alignment: .leading, spacing: 20){
                        VStack(alignment: .leading, spacing: 2){
                            Text("Preferred Arrival Time")
                                .padding(.leading, 10)
                                .font(.system(size: 18, weight: .semibold))
                            ArriveShell()
                                .environmentObject(settingsManager)
                        }
                        Divider()
                            .overlay(Color.gray)
                        VStack(alignment: .leading, spacing: 2){
                            Text("Prioritize Schedule?")
                                .padding(.leading, 10)
                                .font(.system(size: 18, weight: .semibold))
                            PrioritizeSchedule()
                                .environmentObject(settingsManager)
                        }
                        Divider()
                            .overlay(Color.gray)
                        VStack(alignment: .leading, spacing: 2){
                            Text("Theme")
                                .padding(.leading, 10)
                                .font(.system(size: 18, weight: .semibold))
                            ThemePicker()
                                .environmentObject(settingsManager)
                        }
                        Divider()
                            .overlay(Color.gray)
                        PullFirebaseButton()
                            .environmentObject(sessionManager)
                        Divider()
                            .overlay(Color.gray)
                        VStack(alignment: .center) {
                            SignOutButton()
                                .environmentObject(sessionManager)
                        }
                        .frame(maxWidth: .infinity)
                        Spacer()
                    }
                    .offset(y: -10)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.backgroundGradient)
                            .offset(y:-20)
                    }
                }
                .padding(5)
            }
        }
    }


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
//            .environment(\.colorScheme, .dark)
            .environmentObject(SettingsManager())
            .environmentObject(SessionManager())
    }
}
