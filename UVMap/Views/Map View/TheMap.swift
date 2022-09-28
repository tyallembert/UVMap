//
//  TheMap.swift
//  UVMap
//
//  Created by Ty Allembert on 9/26/22.
//

import SwiftUI
import MapKit

struct TheMap: View {
    @StateObject private var viewModel = TheMapModel()
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .edgesIgnoringSafeArea(.all)
                .accentColor(.red)
                .onAppear {
                    viewModel.checkIfLocationEnabled()
                }
        }
    }
}

struct TheMap_Previews: PreviewProvider {
    static var previews: some View {
        TheMap()
    }
}

final class TheMapModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44.4779, longitude: -73.1965),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        
    var locationManager: CLLocationManager?
    
    func checkIfLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self //MAYBE CHNAGE FORCE UNWRAP
        }else{
            //make alert that tells user to turn it on
        }
    }
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization() //MAYBE CHNAGE THIS IF MAKE FRIEND SYSTEM
        case .restricted:
            print("alert user that its restricted due to parental restrictions or something")
        case .denied:
            print("alert user they have denied permission earlier and that they need to allow location in settings")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        @unknown default:
            break
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
