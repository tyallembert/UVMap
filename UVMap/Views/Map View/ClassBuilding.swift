//
//  ClassBuilding.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct ClassBuilding: View {
    @EnvironmentObject var mapManager: MapManager
    
    var body: some View {
        Text(mapManager.getActiveBuilding().name)
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
    }
}

struct ClassBuilding_Previews: PreviewProvider {
    static var previews: some View {
        ClassBuilding()
            .environmentObject(MapManager())
    }
}
