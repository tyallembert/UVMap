//
//  MainNavigation.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI

struct MainNavigation: View {
    var body: some View {
        TabView{
            MapView()
                .tabItem(){
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            ScheduleView()
                .tabItem(){
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
            SettingsView()
                .tabItem(){
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
        .onAppear(){
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    }
}

struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigation()
    }
}
