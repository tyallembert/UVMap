//
//  NavigationBar.swift
//  UVMap
//
//  Created by Ty Allembert on 10/21/22.
//

import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var sessionManager: SessionManager
    var tabBarImageNames = ["calendar", "house.fill", "person"]
    var body: some View {
        VStack {
            Spacer()
            HStack{
                ForEach(0..<3) {element in
                    Spacer()
                    Button(action: {
                        sessionManager.selectedNavElement = element
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
                                .foregroundColor(sessionManager.selectedNavElement == element ? Color(.white): Color("TXT1"))
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

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
