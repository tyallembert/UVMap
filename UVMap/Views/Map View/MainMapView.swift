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
    case middle = 0.415 //350/844
    case bottom = 0.230 //325/844
}

struct MainMapView: View {
    @EnvironmentObject var mapManager: MapManager
    @EnvironmentObject var classManager: ClassManager
    @EnvironmentObject var settingsManager: SettingsManager
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    
    @StateObject private var databaseManager = DatabaseManager()
//    @State var showingBottomWindow = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TheMap()
                .environmentObject(mapManager)
                .environmentObject(databaseManager)
            VStack(alignment: .leading) {
                BuildingSearchResults()
                    .environmentObject(mapManager)
                    .environmentObject(databaseManager)
                CurrentLocationButton()
                    .environmentObject(mapManager)
                    .padding()
                
                // MARK: draggable bottom sheet
                BottomSheetView(position: $bottomSheetPosition){}content: {
                    BottomWindow(bottomSheetPosition: $bottomSheetPosition)
                        .shadow(radius: 5)
                        .environmentObject(mapManager)
                        .environmentObject(settingsManager)
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
