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
//                SettingsView()
                AddClassView()
            case 3:
                AddClassView()
            default:
                MainMapView()
            }
            // Style of Nav Bar
            NavigationBar()
        }
}

//    TabView{
//        MainMapView()
//            .tabItem(){
//                Image(systemName: "house.fill")
//                Text("Home")
//            }
//        ScheduleView()
//            .tabItem(){
//                Image(systemName: "calendar")
//                Text("Schedule")
//            }
//        SettingsView()
//            .tabItem(){
//                Image(systemName: "person.fill")
//                Text("Profile")
//            }
//    }
//    .accentColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
//    .onAppear(){
////            UITabBar.appearance().backgroundColor = UIColor.white
//        let appearance = UITabBarAppearance()
//        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
//        appearance.backgroundColor = UIColor(Color.white.opacity(0.2))
//
//        // Use this appearance when scrolling behind the TabView:
//        UITabBar.appearance().standardAppearance = appearance
//        // Use this appearance when scrolled all the way up:
//        UITabBar.appearance().scrollEdgeAppearance = appearance
//    }
//    .background(Color("BG1"))
}
struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigation()
    }
}
