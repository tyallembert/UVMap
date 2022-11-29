//
//  MainNavigation.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI

struct MainNavigation: View {
    @EnvironmentObject var sessionManager: SessionManager
    @StateObject var classManager: ClassManager = ClassManager()
    @StateObject var mapManager: MapManager = MapManager()
    @StateObject var settingsManager: SettingsManager = SettingsManager()
    
    var body: some View {
        ZStack{
            switch sessionManager.selectedNavElement {
            case 0:
                ScheduleView()
                    .environmentObject(classManager)
            case 1:
                MainMapView()
                    .environmentObject(classManager)
                    .environmentObject(mapManager)
            case 2:
                SettingsView()
                    .environmentObject(settingsManager)

            case 3:
                AddClassView()
                    .environmentObject(classManager)
            default:
                MainMapView()
                    .environmentObject(classManager)
                    .environmentObject(mapManager)
            }
            // Style of Nav Bar
            NavigationBar()
        }
    }
}
struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigation()
    }
}
