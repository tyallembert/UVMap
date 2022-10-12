//
//  CurrentLocationButton.swift
//  UVMap
//
//  Created by Ty Allembert on 10/3/22.
//

import SwiftUI

struct CurrentLocationButton: View {
    @EnvironmentObject var mapManager: MapManager
    
    var body: some View {
        Button {
            mapManager.focusLocation()
        }label: {
            Image(systemName: "location")
        }
        .padding()
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.white.opacity(0.4))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CurrentLocationButton_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationButton()
    }
}
