//
//  OneBuildingResult.swift
//  UVMap
//
//  Created by Jack McGowan on 11/9/22.
//

import SwiftUI

struct OneBuildingResult: View {
    @EnvironmentObject var building: Building
    @EnvironmentObject var mapManager: MapManager
    
    var body: some View {
        HStack {
            Text("\(building.name)")
                .font(.system(size: 20, weight: .semibold))
        }
        .padding()
        
    }
}
