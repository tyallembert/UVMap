//
//  BottomWindow.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct BottomWindow: View {
    @EnvironmentObject var mapManager: MapManager
    @EnvironmentObject var classManager: ClassManager
    @EnvironmentObject var settingsManager: SettingsManager
    @Binding var bottomSheetPosition: BottomSheetPosition
    var body: some View {
        ScrollView {
            VStack {
                switch bottomSheetPosition{
                    // MARK: view for when the bottom sheet is pulled up
                    case .top, .middle:
                        if mapManager.routes.isEmpty { TopSchedule() }
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    ClassBuilding()
                                        .environmentObject(mapManager)
                                    Spacer()
                                }
                                HStack {
                                    NextClass()
                                    Spacer()
                                }
                                HStack {
                                    ClassTime()
                                    Spacer()
                                }
                            }
                            if mapManager.routes.isEmpty {
                                WalkBikeOption()
                                    .environmentObject(mapManager)
                            }
                            Spacer()
                        }
                        if mapManager.routes.isEmpty {
                            StartButton(bottomSheetPosition: $bottomSheetPosition)
                                .environmentObject(mapManager)
                        }
                        else {
                            EndRouteButton(bottomSheetPosition: $bottomSheetPosition)
                                .environmentObject(mapManager)
                        }
                        
                    if !mapManager.routes.isEmpty {
                        TripInformation()
                            .environmentObject(settingsManager)
                            .environmentObject(mapManager)
                        
                    }
                    // MARK: view for when the bottom sheet is pulled down
                    case .bottom:
                        HStack {
                            ClassBuilding()
                                .environmentObject(mapManager)
                            if mapManager.routes.isEmpty {
                                StartButton(bottomSheetPosition: $bottomSheetPosition)
                                    .environmentObject(mapManager)
                            }
                            else {
                                EndRouteButton(bottomSheetPosition: $bottomSheetPosition)
                                    .environmentObject(mapManager)
                            }
                        }
                }
            }
            .padding()
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 35))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 35), color: Color.innerShadow, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 2, blendMode: .overlay, opacity: 0.8)
        .overlay{
            // MARK: bottom sheet seperator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 35))
        }
        .overlay{
            // MARK: little drag indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

//struct BottomWindow_Previews: PreviewProvider {
//    var bottomSheetPosition: BottomSheetPosition = .middle
//    static var previews: some View {
//        BottomWindow(bottomSheetPosition: bottomSheetPosition)
//            .environmentObject(MapManager())
//            .background(Color.background)
//            .preferredColorScheme(.dark)
//    }
//}


