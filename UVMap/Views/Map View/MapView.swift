//
//  MapView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI

struct MapView: View {
    
    var body: some View {
        ZStack {
            TheMap()
            VStack {
                SearchBar()
                Spacer()
                BottomWindow()
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
