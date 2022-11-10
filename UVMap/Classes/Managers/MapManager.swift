//
//  MapManager.swift
//  UVMap
//
//  Created by Ty Allembert on 10/3/22.
//

import SwiftUI
import MapKit
import CoreLocation

class MapManager: NSObject, ObservableObject, CLLocationManagerDelegate, MKMapViewDelegate {
    
    //========================================================
    //                      constants
    //========================================================
    let REGION_RADIUS : CLLocationDistance = 300
    let LATITUDE_OFFSET : Double = 0.0007 // makes the users cented location at the top of the screen
    
    //========================================================
    //                      variables
    //========================================================

    @Published var mapView = MKMapView()
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44.4779, longitude: -73.1965),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    var locationManager: CLLocationManager = CLLocationManager()
    @Published var activeBuildingsFromSearch: [Building] = []
    @Published var activeBuilding: Building?
    @Published var followUser: Bool = true
    @Published var routes: [MKRoute] = []
    @Published var searchText: String = ""
    @Published var buildings: [Building] = []
    @Published var searchActive: Bool = false
    @Published var startText: String = "Start"
    @State var eta: Int?
    
    
    
    
//========================================================
//                      functions
//========================================================
    //--------------------------------------
    //          building functions
    //--------------------------------------
    func setActiveBuilding(building: Building){
        self.activeBuilding = building
    }
    func getActiveBuilding() -> Building {
        if let activeBuilding = self.activeBuilding {
            return activeBuilding
        }else{
            return Building(id: "zero", name: "University of Vermont", address: "", coordinate: CLLocationCoordinate2D(latitude: 44.4779, longitude: -73.1965))
        }
    }
    
    func filterBuildings() {
        if searchText.isEmpty {
            activeBuildingsFromSearch = buildings
        } else {
            activeBuildingsFromSearch = buildings.filter { ($0.name).lowercased().contains(searchText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))
            }
        }
    }
    
    func setBuildings(_ buildings: [Building]) {
        self.buildings = buildings
    }
    
    
    //--------------------------------------
    //          user functions
    //--------------------------------------
    func initMap() {
        locationManager = CLLocationManager()
        locationManagerConfig()
        mapViewConfig()
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch manager.authorizationStatus {
            
            case .notDetermined:
                manager.requestWhenInUseAuthorization() //MAYBE CHNAGE THIS IF MAKE FRIEND SYSTEM
            case .restricted:
                print("alert user that its restricted due to parental restrictions or something")
            case .denied:
                print("alert user they have denied permission earlier and that they need to allow location in settings")
            case .authorizedAlways, .authorizedWhenInUse:

                initMap()
                region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: manager.location!.coordinate.latitude - LATITUDE_OFFSET, longitude: manager.location!.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
                let _ = print(manager.location!.coordinate)
            default:
                break
        }
    }
    
    func cancelRoutes() {
        routes.removeAll()
        startText = "Start"
    }
    
    func buildRoutes(completion: @escaping (Int) -> Void){
        var eta : Int = 0
        @State var isEtaUpdated : Bool = false
        if let loc = locationManager.location {
            let origin = loc
            let end = getActiveBuilding()
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: origin.coordinate))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: end.coordinate))
            request.requestsAlternateRoutes = false
            request.transportType = .walking
            
            let directions = MKDirections(request: request)
            directions.calculate { [unowned self] response, error in
                guard let unwrappedResponse = response else { return }
                routes = unwrappedResponse.routes
//                let val = routes[0].expectedTravelTime
//                let _ = print(val)
//                let _ = print(val / 60.0)
//                let _ = print(ceil(val / 60.0))
                eta = Int(ceil(routes[0].expectedTravelTime / 60.0))
                startText = "ETA: \(eta)m"
                completion(eta)
            }
        }
    }
    
    
    // Takes in coordinates and updates the map view and region
    func updateMapView(_ cords: CLLocation) {
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: cords.coordinate.latitude - LATITUDE_OFFSET, longitude: cords.coordinate.longitude), latitudinalMeters: REGION_RADIUS, longitudinalMeters: REGION_RADIUS)
    }
    
    // Runs Map View init items
    func mapViewConfig() {
        // INSTRUCTIONS FOR MAP
        mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
        mapView.delegate = self
    }
    
    // Runs location manager init items
    func locationManagerConfig() {
        // INSTRUCTIONS FOR LOCATION MANAGER
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
        
    func checkAtCurrentRegion() -> Bool {
        return (mapView.region.center.latitude != self.region.center.latitude ||
                mapView.region.center.longitude != self.region.center.latitude ||
                mapView.region.span.latitudeDelta != self.region.span.latitudeDelta ||
                mapView.region.span.longitudeDelta != self.region.span.longitudeDelta ) ? false : true
    }
    
    //makes map center over user location when button is clicked
    func focusLocation(){
        followUser = true
        
        if followUser {
            if let loc = locationManager.location {
                updateMapView(loc)
            }
        }
    }
        
    func checkMoved() {
        if !followUser {
            return
        }
        
        if !checkAtCurrentRegion() {
            followUser = false
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if followUser  {
            guard let location = locations.last else{return}
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude - LATITUDE_OFFSET, longitude: location.coordinate.longitude)
            self.region = MKCoordinateRegion(center: center, latitudinalMeters: REGION_RADIUS, longitudinalMeters: REGION_RADIUS)
            mapView.setRegion(region, animated: true)
            mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
        }
        else {
            
        }
    }
}
