//
//  TheMap.swift
//  UVMap
//
//  Created by Ty Allembert on 9/26/22.
//

import SwiftUI
import MapKit

struct TheMap: View {
    @EnvironmentObject var mapManager: MapManager
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $mapManager.region, showsUserLocation: true)
                .edgesIgnoringSafeArea(.all)
                .accentColor(.red)
                .onAppear {
                    mapManager.checkIfLocationEnabled()
                }
        }
    }
}

struct TheMap_Previews: PreviewProvider {
    static var previews: some View {
        TheMap()
    }
}
