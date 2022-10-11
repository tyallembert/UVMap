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
    //                      variables
    //========================================================
    @Published var mapView = MKMapView()
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44.4779, longitude: -73.1965),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    var locationManager: CLLocationManager = CLLocationManager()
    @Published var activeBuildings: [Building] = []
    
    //========================================================
    //                      functions
    //========================================================
    func setActiveBuildings(buildings: [Building]){
        let _ = print("setting active buildings")
        self.activeBuildings.removeAll()
        self.activeBuildings = buildings
    }
    func checkIfLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
        }else{
            //make alert that tells user to turn it on
            print("location not enabled")
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
            
            case .notDetermined:
                manager.requestWhenInUseAuthorization() //MAYBE CHNAGE THIS IF MAKE FRIEND SYSTEM
            case .restricted:
                print("alert user that its restricted due to parental restrictions or something")
            case .denied:
                print("alert user they have denied permission earlier and that they need to allow location in settings")
            case .authorizedAlways, .authorizedWhenInUse:
                region = MKCoordinateRegion(center: manager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
                let _ = print(manager.location!.coordinate)
            default:
                break
        }
    }
    //makes map center over user location when button is clicked
    func focusLocation(){
//        guard let _ = region else{return}
//        let _ = print("focus location function")
        mapView.setRegion(self.region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{return}
        
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 0.5, longitudinalMeters: 0.5)
        
        self.mapView.setRegion(self.region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
}
