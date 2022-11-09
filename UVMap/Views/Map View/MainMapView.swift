//
//  MapView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//
import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.75 //633/844
    case middle = 0.385 //325/844
    case bottom = 0.230 //325/844
}

struct MainMapView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @StateObject private var mapManager = MapManager()
//    @State var showingBottomWindow = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TheMap()
                .environmentObject(mapManager)
            VStack(alignment: .leading) {
                SearchBar()
                CurrentLocationButton()
                    .environmentObject(mapManager)
                    .padding()
                // MARK: draggable bottom sheet
                BottomSheetView(position: $bottomSheetPosition){}content: {
                    BottomWindow(bottomSheetPosition: $bottomSheetPosition)
                        .shadow(radius: 5)
                        .environmentObject(mapManager)
                }
            }
        }
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MainMapView()
            .environmentObject(MapManager())
    }
}
