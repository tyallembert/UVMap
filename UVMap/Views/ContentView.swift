//
//  ContentView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var loggedIn: Bool = false
    
    var body: some View {
//        TabView{
//            MapView()
//                .tabItem(){
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
//            ScheduleView()
//                .tabItem(){
//                    Image(systemName: "calendar")
//                    Text("Schedule")
//                }
//            SettingsView()
//                .tabItem(){
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
//        }
//        .background(.white)
//        .shadow(color: .black, radius: 3, x: 1, y: 2)
//        .accentColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
        Text("Hello")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
