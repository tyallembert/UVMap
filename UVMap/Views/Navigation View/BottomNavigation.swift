//
//  BottomNavigation.swift
//  UVMap
//
//  Created by Ty Allembert on 9/26/22.
//

import SwiftUI

struct BottomNavigation: View {
    var body: some View {
            
        HStack {
            // Home Button
            Button(action: {
                // Do something...
                }, label: {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                            .font(.system(size: 12))
                    }
            })
            .frame(maxWidth: .infinity)
            // Schedule Button
            Button(action: {
                // Do something...
                }, label: {
                    VStack {
                        Image(systemName: "calendar")
                        Text("Schedule")
                            .font(.system(size: 12))
                    }
            })
            .frame(maxWidth: .infinity)
            // Settings Button
            Button(action: {
                // Do something...
                }, label: {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Profile")
                            .font(.system(size: 12))
                    }
            })
            .frame(maxWidth: .infinity)
        }
        .padding()
        .edgesIgnoringSafeArea(.all)
        .font(.system(size: 25))
        .foregroundColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
        .frame(maxWidth: .infinity, alignment: .bottom)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(
                    color: Color.gray.opacity(0.6),
                    radius: 5,
                    x: 0,
                    y: -3
                )
        )
    }
}

struct BottomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigation()
    }
}
