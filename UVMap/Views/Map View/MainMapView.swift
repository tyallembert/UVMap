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
    @State var updateOnUserMotion: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                TheMap()
                    .onTapGesture {
                        self.showingBottomWindow = false
                    }
                    .environmentObject(mapManager)
                HStack {
                    SearchBar()
                    let _ = print(self.updateOnUserMotion)
                    CurrentLocationButton(followUser: $updateOnUserMotion)
                        .environmentObject(mapManager)
                        .padding(10)
                        .onTapGesture {
                            self.updateOnUserMotion.toggle()
                        }
                }
            }
            if showingBottomWindow {
                BottomWindow()
                    .cornerRadius(10)
                    .padding()
                    .background(.ultraThinMaterial)
                    .transition(AnyTransition.move(edge: .bottom))
            }else{
                BottomWindowMinimized()
//                    .animation(.easeIn(duration: 0.5), value: showingBottomWindow)
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


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MainMapView()
    }
}
