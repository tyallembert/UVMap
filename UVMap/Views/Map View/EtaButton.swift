//
//  EndRouteButton.swift
//  UVMap
//
//  Created by Jack McGowan on 11/16/22.
//

import SwiftUI

struct EtaButton: View {
    @EnvironmentObject var mapManager: MapManager
    
    
    var body: some View {
        Button(role: .destructive) {
            mapManager.cancelRoutes()
        } label: {
            Label("\(mapManager.etaText)", systemImage: "location.circle")
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                .font(.title2)
        }
        .padding()
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.backgroundGreen)
        .foregroundColor(.white)
//        .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: Color.innerShadow, lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
