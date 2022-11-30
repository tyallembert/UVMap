//
//  StartButton.swift
//  UVMap
//
//  Created by Ty Allembert on 9/29/22.
//

import SwiftUI

struct StartButton: View {
    @EnvironmentObject var mapManager: MapManager
    @Binding var bottomSheetPosition: BottomSheetPosition
    
    func handleStartClicked() {
        // async function call to buildRoutes
        mapManager.buildings = [mapManager.getActiveBuilding()]
        mapManager.buildRoutes { eta in }
        bottomSheetPosition = mapManager.bottomSheetPosition
        
    }
    var body: some View {
        Button (action: {
            handleStartClicked()
        }){
            Text("Start")
                .font(.title2)
                .fontWeight(.heavy)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.backgroundGreen)
        .cornerRadius(10)
        .shadow(color: .black, radius: 3, x: 2, y: 3)
    }
}

//struct StartButton_Previews: PreviewProvider {
//    static var previews: some View {
//        StartButton(BottomSheetPosition: bottomSheetPosition)
//    }
//}
