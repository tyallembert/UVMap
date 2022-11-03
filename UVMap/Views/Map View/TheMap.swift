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
    @Binding var region: MKCoordinateRegion
    
    
    var body: some View {
        let map : MKMapView() = mapManager.getMapView()
        VStack {
            
                .environmentObject(mapManager)
//            MapView()
//                .environmentObject(mapManager)
//                .onAppear{
//                    mapManager.initMap()
//                }
//                .gesture(DragGesture().onChanged({_ in mapManager.checkMoved()}))
//                .edgesIgnoringSafeArea(.all)
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
//            Map(coordinateRegion: $mapManager.region,
//                showsUserLocation: true,
//                annotationItems: databaseManager.buildings,
//               annotationContent: { location in
//                MapAnnotation(coordinate: location.coordinate){
//                    BuildingAnnotation()
//                        .scaleEffect(mapManager.activeBuilding == location ? 1.2 : 0.8)
//                        .opacity(mapManager.activeBuilding == location ? 1 : 0.7)
//                        .onTapGesture {
//                            mapManager.setActiveBuilding(building: location)
//                        }
//                        .animation(.spring(), value: mapManager.activeBuilding)
//                }
//               })
//                .edgesIgnoringSafeArea(.all)
//                .accentColor(Color("AccentColor"))
//                .onAppear {
//                    mapManager.initMap()
//                }
//                .gesture(DragGesture().onChanged({_ in mapManager.checkMoved()}))
        }
    }
}

/*
struct MapView: UIViewRepresentable {
    @EnvironmentObject var mapManager: MapManager
//    @Binding var selectedRegion: MKCoordinateRegion
    typealias UIViewType = MKMapView
    
    let mapView = MKMapView()


    func makeCoordinator() -> MapViewCoordinator {
      return MapViewCoordinator()
    }

    func makeUIView(context: Context) -> MKMapView {
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        mapView.setRegion($mapManager.region.wrappedValue, animated: true)
        

        // NYC
//        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.71, longitude: -74))
//
//        // Boston
//        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.36, longitude: -71.05))

//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark: p1)
//        request.destination = MKMapItem(placemark: p2)
//        request.transportType = .automobile

//        let directions = MKDirections(request: request)
//        directions.calculate { response, error in
//            guard let route = response?.routes.first else { return }
//            mapView.addAnnotations([p1, p2])
//            mapView.addOverlay(route.polyline)
//            mapView.setVisibleMapRect(
//              route.polyline.boundingMapRect,
//              animated: true)
//        }


        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
//        mapView.showsUserLocation = true
        mapView.setRegion($mapManager.region.wrappedValue, animated: true)
    }

    class MapViewCoordinator: NSObject, MKMapViewDelegate {
      func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .systemBlue
        renderer.lineWidth = 5
        return renderer
      }
    }
}
*/


//
//struct TheMap_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
