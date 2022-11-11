//
//  StartButton.swift
//  UVMap
//
//  Created by Ty Allembert on 9/29/22.
//

import SwiftUI

struct StartButton: View {
    @EnvironmentObject var mapManager: MapManager
    
    func handleStartClicked() {
        mapManager.buildRoutes { eta in
        }
        
    }
    var body: some View {
        Button (action: {handleStartClicked()}){
            Text(mapManager.startText)
                .font(.title2)
                .fontWeight(.heavy)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
        }
        .foregroundColor(.white)
        .padding()
        .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
        .cornerRadius(10)
        .shadow(color: .black, radius: 3, x: 2, y: 3)
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton()
    }
}
