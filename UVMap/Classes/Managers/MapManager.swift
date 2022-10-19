//
//  MapManager.swift
//  UVMap
//
//  Created by Ty Allembert on 10/3/22.
//

import SwiftUI
import MapKit
import CoreLocation

class MapManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
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
            return Building(id: "0", name: "University of Vermont", address: "", coordinate: CLLocationCoordinate2D(latitude: 44.4779, longitude: -73.1965))
        }
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
    
    // Takes in coordinates and updates the map view and region
    func updateMapView(_ cords: CLLocation) {
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: cords.coordinate.latitude - LATITUDE_OFFSET, longitude: cords.coordinate.longitude), latitudinalMeters: REGION_RADIUS, longitudinalMeters: REGION_RADIUS)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    // Runs Map View init items
    func mapViewConfig() {
        // INSTRUCTIONS FOR MAP
        mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
    }
    
    // Runs location manager init items
    func locationManagerConfig() {
        // INSTRUCTIONS FOR LOCATION MANAGER
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // sets the valid region for fullscreen view
    func setRegionFullScreen() {
        
    }
    
    func setRegionHalfScreen() {
        
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
            self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: REGION_RADIUS, longitudinalMeters: REGION_RADIUS)
            mapView.setRegion(region, animated: true)
            mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
        }
        else {
            
        }
    }
}
