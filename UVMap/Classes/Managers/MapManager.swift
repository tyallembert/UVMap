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
    @Published var etaText: String = "ETA : 0m"
    @Published var userWalking: Bool = true
    @State var eta: Int?
    @Published var endLocation: Building?
    @Published var bottomSheetPosition: BottomSheetPosition = .middle
    
    private var haveShownRouteOverview: Bool = false
    private var hasRebounded: Bool = false
    
    
    
    
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
            return Building(id: "zero", name: "University of Vermont", abbreviation: "", coordinate: CLLocationCoordinate2D(latitude: 44.4779, longitude: -73.1965))
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
        if self.buildings.isEmpty {
            self.buildings = buildings
        }
    }
    // returns the building after clicking one of the buildings in the side scroll menu bar
    func getBuildingFromString(buildingString: String) -> Building{
        var theBuilding: Building = buildings[0]
        for aBuilding in buildings {
            if aBuilding.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).contains(buildingString.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)){
                theBuilding = aBuilding
            }
        }
        return theBuilding
    }
    //--------------------------------------
    //          Route Calculations
    //--------------------------------------
    func calculateLeaveTime(){
        
    }
    func calculateArrivalTime(){
        
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
        etaText = "ETA : 0m"
        bottomSheetPosition = .middle
        if let loc = locationManager.location {
            updateMapView(loc)
        }
        haveShownRouteOverview = false
        hasRebounded = false
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
            
            bottomSheetPosition = .bottom
            
            let directions = MKDirections(request: request)
            directions.calculate { [unowned self] response, error in
                guard let unwrappedResponse = response else { return }
                routes = unwrappedResponse.routes

                if !haveShownRouteOverview {
                    let avgLat = (origin.coordinate.latitude + end.coordinate.latitude) / 2.0
                    let avgLong = (origin.coordinate.longitude + end.coordinate.longitude) / 2.0
                    
                    let center = CLLocationCoordinate2D(latitude: avgLat, longitude: avgLong)
                    let distanceBetween = origin.distance(from: CLLocation(latitude: end.coordinate.latitude, longitude: end.coordinate.longitude)) * 1.55
                    self.region = MKCoordinateRegion(center: center, latitudinalMeters: max(distanceBetween, REGION_RADIUS), longitudinalMeters: max(distanceBetween, REGION_RADIUS))
                    haveShownRouteOverview = true
                    followUser = false
                }
                eta = Int(ceil(routes[0].expectedTravelTime / 60.0))
                if !userWalking {
                    eta = Int(ceil(Double(eta) / 3.0))
                }
                etaText = "ETA: \(eta)m"
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
        guard let location = locations.last else{return}
        if followUser  {
//            guard let location = locations.last else{return}
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude - LATITUDE_OFFSET, longitude: location.coordinate.longitude)
            self.region = MKCoordinateRegion(center: center, latitudinalMeters: REGION_RADIUS, longitudinalMeters: REGION_RADIUS)
            mapView.setRegion(region, animated: true)
            mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
        }
        else {
            if haveShownRouteOverview && !hasRebounded{
                // Recenters the view after 3.5 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    self.focusLocation()
                    self.hasRebounded = true
                }
            }
        }
        
        if !routes.isEmpty {
            var ended = false
            let endCord = getActiveBuilding().coordinate
            let lattRange = (endCord.latitude - 0.0002)...(endCord.latitude + 0.0002)
            let longRange = (endCord.longitude - 0.0002)...(endCord.longitude + 0.0002)
            
            if lattRange.contains(location.coordinate.latitude) && longRange.contains(location.coordinate.longitude) {
                cancelRoutes()
                ended = true
            }
            
            if !ended {
                // calls async buildRoutes function
                buildRoutes{eta in}
            }
        }
    }
}
