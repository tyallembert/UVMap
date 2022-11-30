//
//  TripInformation.swift
//  UVMap
//
//  Created by Ty Allembert on 9/29/22.
//

import SwiftUI

struct TripInformation: View {
    @EnvironmentObject var settingsManager: SettingsManager
    @EnvironmentObject var classManager: ClassManager
    @EnvironmentObject var mapManager: MapManager
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("\(mapManager.getEta()) min")
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .offset(x: 30)
                    Spacer()
                    Text("\(String(format: "%03.1f", mapManager.getDistance())) mi")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .offset(x: -30)
                }
                .padding()
                .background(Color.backgroundDarker)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.textGreenWhite, lineWidth: 2)
                }
                //                .background(Color("BG2"))
                //                .cornerRadius(10)
                //                .shadow(color: Color.black.opacity(0.30), radius: 5, x: 0, y: 0)
                HStack {
                    if let routeEta = mapManager.ETA {
                        //if classManager.activeClass != nil { //& !mapManager.routes.isEmpty{
                        //if let routeEta = mapManager.ETA {
                        
                        let earlyOffset = settingsManager.currentSettings.howEarly
                        //let routeEta = mapManager.ETA
                        //if let toClass = classManager.activeClass?.startTime{
                        //let startTime = toClass.startTime
                        //let startTime = classManager.activeClass.startTime
                        let suggestedLeaveTime = settingsManager.earlyCalculation(inTime: "10:05", eta: routeEta, earlyOffset: earlyOffset)
                        VStack {
                            Text("Suggested Leave Time")
                            Text("\(suggestedLeaveTime)")
                                .font(.system(size: 25))
                                .fontWeight(.heavy)
                        }
                        .padding()
                        .background(Color.backgroundDarker)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.textGreenWhite, lineWidth: 2)
                        }
                        
                        Spacer()
                    }
                    
                    VStack {
                        Text("Arrival Time if you leave now")
                        Text("7:58am")
                            .font(.system(size: 25))
                            .fontWeight(.heavy)
                    }
                    .padding()
                    .background(Color.backgroundDarker)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.textGreenWhite, lineWidth: 2)
                    }
                }
                
            }
            .padding()
        }
        .frame(height: 200, alignment: .bottom)
    }
}


struct TripInformation_Previews: PreviewProvider {
    static var previews: some View {
        TripInformation()
    }
}
