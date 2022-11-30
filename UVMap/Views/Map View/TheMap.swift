//
//  TheMap.swift
//  UVMap
//
//  Created by Ty Allembert on 9/26/22.
//

import SwiftUI
import Map
import MapKit


struct TheMap: View {
    @EnvironmentObject var mapManager: MapManager
    @EnvironmentObject var databaseManager: DatabaseManager
    
    @State private var userTrackingMode = MKUserTrackingMode.follow

    var body: some View {
        VStack {
            Map(coordinateRegion: $mapManager.region,
                type: .standard,
                userTrackingMode: $userTrackingMode,
                annotationItems: mapManager.buildings,
                annotationContent: { location in
                ViewMapAnnotation(coordinate: location.coordinate){
                    BuildingAnnotation()
                        .scaleEffect(mapManager.activeBuilding == location ? 1.4 : 1.0)
                    //                        .opacity(mapManager.activeBuilding == location ? 1 : 0.7)
                        .animation(.spring(), value: mapManager.activeBuilding)
                        .environmentObject(mapManager)
                        .environmentObject(location)
                }
            },
                overlays: mapManager.routes.map { $0.polyline },
                overlayContent: { overlay in
                RendererMapOverlay(overlay: overlay) { mapView, overlay in
                    guard let polyline = overlay as? MKPolyline else {
                        assertionFailure("Unknown overlay type encountered.")
                        return MKOverlayRenderer(overlay: overlay)
                    }
                    let renderer = MKPolylineRenderer(polyline: polyline)
                    renderer.lineWidth = 5
                    renderer.strokeColor = UIColor(named: "UVM_Gold")
                    return renderer
                }
            })
            .edgesIgnoringSafeArea(.all)
            .accentColor(Color("AccentColor"))
            .onAppear {
                mapManager.initMap()
                mapManager.setBuildings(databaseManager.buildings)
            }
            .gesture(DragGesture().onChanged({_ in mapManager.checkMoved()}))
        }
    }
}

//
//struct TheMap_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
