//
//  EndRouteButton.swift
//  UVMap
//
//  Created by Jack McGowan on 11/10/22.
//

import SwiftUI

struct EndRouteButton: View {
    @EnvironmentObject var mapManager: MapManager
    @EnvironmentObject var databaseManager: DatabaseManager
    @Binding var bottomSheetPosition: BottomSheetPosition
    
    
    var body: some View {
        Button(role: .destructive) {
            mapManager.buildings = databaseManager.buildings
            mapManager.cancelRoutes()
            bottomSheetPosition = mapManager.bottomSheetPosition
        } label: {
            Label("End Route", systemImage: "exclamationmark.octagon")
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
        }
        .padding()
        .backgroundBlur(radius: 25, opaque: true)
        .background(.red)
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
