//
//  SearchResults.swift
//  UVMap
//
//  Created by Jack McGowan on 11/9/22.
//

import SwiftUI

struct BuildingSearchResults: View {
    @EnvironmentObject var mapManager: MapManager
    @EnvironmentObject var databaseManager: DatabaseManager
    
    @State var search: String = ""
    
    var body: some View {
        VStack {
            if mapManager.routes.isEmpty {
                SearchBar()
                    .environmentObject(mapManager)
                ScrollView {
                    LazyVStack {
                        ForEach(mapManager.activeBuildingsFromSearch, id: \.self.id) { building in
                            OneBuildingResult()
                                .environmentObject(building)
                                .environmentObject(mapManager)
                                .onTapGesture {
                                    mapManager.setActiveBuilding(building: building)
                                    withAnimation{
                                        mapManager.searchActive = false
                                        mapManager.searchText = ""
                                        hideKeyboard()
                                    }
                                }
                            Divider()
                        }
                    }
                }
                .frame(height: mapManager.searchActive ? 250: 0)
                .backgroundBlur(radius: 15, opaque: true)
                .background(Color.white.opacity(0.4))
                .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: Color.innerShadow, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 2, blendMode: .overlay, opacity: 0.7)
                .cornerRadius(10)
                .offset(y: -5)
                .shadow(color: .black.opacity(0.3),radius: 7)
                .onAppear{
                    mapManager.filterBuildings()
                }
                .padding(5)
            }
            else {
                EtaButton()
                    .padding()
            }
        }
    }
}
