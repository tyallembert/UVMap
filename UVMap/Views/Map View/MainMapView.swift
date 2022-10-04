//
//  MapView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI

struct MainMapView: View {
    
    @StateObject private var mapManager = MapManager()
    @State var showingBottomWindow = true
    
    var body: some View {
        ZStack {
            TheMap()
                .onTapGesture {
                    self.showingBottomWindow = false
                }
                .environmentObject(mapManager)
            
            VStack {
                SearchBar()
                HStack {
                    Spacer()
                    CurrentLocationButton()
                        .environmentObject(mapManager)
                }
                Spacer()
                if showingBottomWindow {
                    BottomWindow()
                        .cornerRadius(10)
                        .padding()
                        .background(Color("BG1").opacity(0.9)
                                    .shadow(color: Color.black.opacity(0.30), radius: 5, x: 0, y: 0))
                        .animation(.default)
                        .transition(AnyTransition.move(edge: .bottom))
                }else{
                    BottomWindowMinimized()
                        .animation(.easeIn)
                        .transition(AnyTransition.move(edge: .bottom))
                        .background(Color("BG1").opacity(0.9)
                                    .shadow(color: Color.black.opacity(0.30), radius: 5, x: 0, y: 0))
                        .onTapGesture {
                            self.showingBottomWindow = true
                        }
                }
            }
            .animation(.easeInOut, value: showingBottomWindow)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MainMapView()
    }
}
