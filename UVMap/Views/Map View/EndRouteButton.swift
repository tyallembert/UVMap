//
//  EndRouteButton.swift
//  UVMap
//
//  Created by Jack McGowan on 11/10/22.
//

import SwiftUI

struct EndRouteButton: View {
    @EnvironmentObject var mapManager: MapManager
    
    
    var body: some View {
        Button(role: .destructive) {
            mapManager.cancelRoutes()
        } label: {
            Label("End Route", systemImage: "exclamationmark.octagon")
                .frame(maxWidth: .infinity)
        }
        .padding()
        .backgroundBlur(radius: 25, opaque: true)
        .background(.red)
        .foregroundColor(.white)
//        .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: Color.innerShadow, lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
