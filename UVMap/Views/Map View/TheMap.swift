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
    @EnvironmentObject var databaseManager: DatabaseManager
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $mapManager.region,
                showsUserLocation: true,
                annotationItems: databaseManager.buildings,
               annotationContent: { location in
                MapAnnotation(coordinate: location.coordinate){
                    BuildingAnnotation()
                        .scaleEffect(mapManager.activeBuildings.contains(location) ? 1.2 : 0.8)
                        .opacity(mapManager.activeBuildings.contains(location) ? 1 : 0.7)
                        .onTapGesture {
                            mapManager.setActiveBuildings(buildings: [location])
                        }
                        .animation(.spring())
                }
               })
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
