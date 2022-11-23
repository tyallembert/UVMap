//
//  SettingsView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/24/22.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var settingsManager = SettingsManager()// = SettingsManager()
    @State var howEarly: Int = 10//settingsManager.early//SettingsManager().early
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
                        
                        ArriveShell(howEarly: $howEarly)
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
                    
                }.padding()
            }
            
        }
        .background(Color.backgroundLighter)
        }
    }


//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//            .environment(\.colorScheme, .dark)
//    }
//}
