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
    
//    // Old Mill
//    let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 44.4778218, longitude: -73.1988305))
//    // Gutterson
//    let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 44.4693674, longitude: -73.1934625))
//    let request = MKDirections.Request()
//    let directions = MKDirections(request: request)
    
    
//    @Binding var region: MKCoordinateRegion
    var body: some View {
//        request.source = MKMapItem(placemark: p1)
//        request.destination = MKMapItem(placemark: p2)
//        request.transportType = .walking
//        directions.calculate { response, error in
//            guard let route = response?.routes.first else { return }
//            //            mapView.addAnnotations(makeAnnotations())
//            //            mapView.addOverlay(route.polyline)
//            //            mapView.setVisibleMapRect(
//            //                route.polyline.boundingMapRect,
//            //                animated: true)
        VStack {
            //            MapView(selectedRegion: $mapManager.region)
            //                .environmentObject(self.mapManager)
            //                .environmentObject(self.databaseManager)
            //                .onAppear{
            //                    mapManager.initMap()
            //                }
            //                .gesture(DragGesture().onChanged({_ in mapManager.checkMoved()}))
            //                .ignoresSafeArea()
            
            //                .addAnnotation( {
            //                    location in
            //                    MapAnnotation(coordinate: location.coordinate){
            //                        BuildingAnnotation()
            //                    }
            //                })
            
            //                .addAnnotation( {
            //                    location in
            //                    MapAnnotation(coordinate: location.coordinate){
            //                        BuildingAnnotation()
            //                            .scaleEffect(mapManager.activeBuilding == location ? 1.2 : 0.8)
            //                            .opacity(mapManager.activeBuilding == location ? 1 : 0.7)
            //                            .onTapGesture {
            //                                mapManager.setActiveBuilding(building: location)
            //                            }
            //                            .animation(.spring(), value: mapManager.activeBuilding)
            //                    }
            //                   }
            //                )
            Map(coordinateRegion: $mapManager.region,
                userTrackingMode: MapUserTrackingMode.follow,
                annotationItems: databaseManager.buildings,
                annotationContent: { location in
                ViewMapAnnotation(coordinate: location.coordinate){
                    BuildingAnnotation()
                        .scaleEffect(mapManager.activeBuilding == location ? 1.2 : 0.8)
                        .opacity(mapManager.activeBuilding == location ? 1 : 0.7)
                        .onTapGesture {
                            mapManager.setActiveBuilding(building: location)
                        }
                        .animation(.spring(), value: mapManager.activeBuilding)
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
                        renderer.lineWidth = 4
                        renderer.strokeColor = .red
                        return renderer
                    }
                })
            .edgesIgnoringSafeArea(.all)
            .accentColor(Color("AccentColor"))
            .onAppear {
                mapManager.initMap()
            }
            .gesture(DragGesture().onChanged({_ in mapManager.checkMoved()}))
        }
    }
}



//struct MapView: UIViewRepresentable {
//    @EnvironmentObject var mapManager: MapManager
//    @EnvironmentObject var databaseManager: DatabaseManager
//    @Binding var selectedRegion: MKCoordinateRegion
//
//
//    typealias UIViewType = MKMapView
//
//    let mapView = MKMapView()
//
//
//    func makeCoordinator() -> MapViewCoordinator {
//      return MapViewCoordinator()
//    }
//
//    func makeAnnotations() -> [MKAnnotation] {
//        var buildings = databaseManager.buildings
//
//        var annotations: [Building] = []
//        for building in buildings {
//            let anno = MapAnnotation(coordinate: building.coordinate) {
//                BuildingAnnotation()
//                    .scaleEffect(mapManager.activeBuilding == building ? 1.2 : 0.8)
//                    .opacity(mapManager.activeBuilding == building ? 1 : 0.7)
//                    .onTapGesture {
//                        mapManager.setActiveBuilding(building: building)
//                    }
//                    .animation(.spring(), value: mapManager.activeBuilding)
//            }
//            annotations.append(building)
//        }
////        { location in
////                            MapAnnotation(coordinate: location.coordinate){
////                                BuildingAnnotation()
////                                    .scaleEffect(mapManager.activeBuilding == location ? 1.2 : 0.8)
////                                    .opacity(mapManager.activeBuilding == location ? 1 : 0.7)
////                                    .onTapGesture {
////                                        mapManager.setActiveBuilding(building: location)
////                                    }
////                                    .animation(.spring(), value: mapManager.activeBuilding)
////                            }
////                           }
//        return buildings
//    }
//
//    func makeUIView(context: Context) -> MKMapView {
//        mapView.showsUserLocation = true
//        mapView.delegate = context.coordinator
//        mapView.setRegion($mapManager.region.wrappedValue, animated: true)
//
//
//        // Old Mill
//        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 44.4778218, longitude: -73.1988305))
//        // Gutterson
//        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 44.4693674, longitude: -73.1934625))
//
//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark: p1)
//        request.destination = MKMapItem(placemark: p2)
//        request.transportType = .walking
//
//        let directions = MKDirections(request: request)
//        directions.calculate { response, error in
//            guard let route = response?.routes.first else { return }
//            mapView.addAnnotations(makeAnnotations())
//            mapView.addOverlay(route.polyline)
//            mapView.setVisibleMapRect(
//              route.polyline.boundingMapRect,
//              animated: true)
//        }
//
//
//        return mapView
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        mapView.showsUserLocation = true
//        mapView.setRegion($mapManager.region.wrappedValue, animated: true)
//        mapView.addAnnotations(makeAnnotations())
//    }
//
//    class MapViewCoordinator: NSObject, MKMapViewDelegate {
//      func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        let renderer = MKPolylineRenderer(overlay: overlay)
//        renderer.strokeColor = .systemBlue
//        renderer.lineWidth = 5
//        return renderer
//      }
//    }
//}


//
//struct TheMap_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
