//
//  NavigationBar.swift
//  UVMap
//
//  Created by Ty Allembert on 10/21/22.
//

import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var sessionManager: SessionManager
    var tabBarImageNames = ["calendar", "map.fill", "person"]
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
                                    .fill(Color.backgroundGreen)
                                    .innerShadow(shape: Circle(), color: Color.innerShadow, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 2, blendMode: .overlay, opacity: 0.5)
                                    .frame(height: 70)
                                    .offset(y: -40)
                                    .shadow(color: Color.black, radius: 3, y: 3)
                            }
                            Image(systemName: tabBarImageNames[element])
                                .foregroundColor(
                                    element == 1 ? Color.white: Color.textGreenWhite)
                                .offset(y: element == 1 ? -40: -10)
                        }
                    })
                    Spacer()
                }
            }
            .padding()
            .frame(height: 100)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .shadow(radius: 4)
            )
        }
        .ignoresSafeArea()
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .environmentObject(SessionManager())
    }
}
