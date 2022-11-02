//
//  MainNavigation.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI

struct MainNavigation: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        ZStack{
            switch sessionManager.selectedNavElement {
            case 0:
                ScheduleView()
            case 1:
                MainMapView()
            case 2:
                SettingsView()
                //AddClassView()
            case 3:
                AddClassView()
            default:
                MainMapView()
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
