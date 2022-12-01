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
                HStack {
                    if let routeEta = mapManager.ETA {
                        let _ = print("ETA worked")
                        
                        let earlyOffset = settingsManager.currentSettings.howEarly
                        
                        if let activeClass = classManager.activeClass {
                            let _ = print("ActiveClass worked")
                            let _ = print(activeClass.startTime)
                            let suggestedLeaveTime = settingsManager.earlyCalculation(inTime: activeClass.startTime,eta: routeEta, earlyOffset: earlyOffset)
                            VStack {
                                Text("Suggested Leave Time")
                                    .fixedSize(horizontal: false, vertical: true)
                                    //.frame(width:geometry.size.width/4)
                                Text("\(suggestedLeaveTime)")
                                    .font(.system(size: 25))
                                    .fontWeight(.heavy)
                            }
                            .frame(width:geometry.size.width/2.75)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                            .background(Color.backgroundDarker)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.textGreenWhite, lineWidth: 2)
                            }
                            Spacer()
                            VStack {
                                Text("Arrival Time if you leave now")
                                    .fixedSize(horizontal: false, vertical: true)
                                let arrivalTime = settingsManager.arrivalIfLeaveNow(eta: routeEta)
                                Text("\(arrivalTime)")
                                    .font(.system(size: 25))
                                    .fontWeight(.heavy)
                            }
                            .frame(width:geometry.size.width/2.75)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                            .background(Color.backgroundDarker)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.textGreenWhite, lineWidth: 2)
                            }
                        }
                    }
                }.frame(width:geometry.size.width/1.25)
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
