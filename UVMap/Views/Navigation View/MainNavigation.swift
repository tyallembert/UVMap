//
//  MainNavigation.swift
//  UVMap
//
//  Created by Ty Allembert on 9/27/22.
//

import SwiftUI

struct MainNavigation: View {
    @State var selectedNavElement = 1
    var tabBarImageNames = ["calendar", "house.fill", "person"]
    
    var body: some View {
        ZStack{
            switch selectedNavElement {
            case 0:
                ScheduleView()
            case 1:
                MainMapView()
            case 2:
                AddClassView()
//                SettingsView()
            default:
                MainMapView()
            }
            
            VStack {
                Spacer()
                HStack{
                    ForEach(0..<3) {element in
                        Spacer()
                        Button(action: {
                            selectedNavElement = element
                        }, label: {
                            ZStack {
                                if element == 1{//the home button
                                    Circle()
                                        .fill(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
                                        .frame(height: 70)
                                        .offset(y: -20)
                                        .shadow(color: Color.black, radius: 3, y: 3)
                                }
                                Image(systemName: tabBarImageNames[element])
                                    .foregroundColor(selectedNavElement == element ? Color(.white): Color("TXT1"))
                                    .offset(y: element == 1 ? -20: 0)
                            }
                        })
                        Spacer()
                    }
                }
                .padding()
                .frame(height: 70)
                .background(.ultraThinMaterial)
                .shadow(radius: 4)
            }
            .ignoresSafeArea()
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
