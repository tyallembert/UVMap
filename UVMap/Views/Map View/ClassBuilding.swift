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
            .foregroundColor(Color("TXT2"))
            .shadow(color: .white, radius: 0.5)
    }
}

struct ClassBuilding_Previews: PreviewProvider {
    static var previews: some View {
        ClassBuilding()
            .environmentObject(MapManager())
    }
}
