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
        .background(Color("BG1"))
        .cornerRadius(10)
    }
}

struct CurrentLocationButton_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationButton()
    }
}
