//
//  TheMap.swift
//  UVMap
//
//  Created by Ty Allembert on 9/26/22.
//

import SwiftUI
import MapKit

struct TheMap: View {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 44.4779, longitude: -73.1965)
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44.4779, longitude: -73.1965),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
                .onAppear {
                    setRegion(coordinate)
            }
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TheMap_Previews: PreviewProvider {
    static var previews: some View {
        TheMap()
    }
}
