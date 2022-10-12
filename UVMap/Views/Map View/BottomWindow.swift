//
//  BottomWindow.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct BottomWindow: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack {
                        HStack {
//                            ClassBuilding()
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
                    WalkBikeOption()
                    Spacer()
                }
                StartButton()
                TripInformation()
            }
            .padding()
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 35))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 35), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1)
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

struct BottomWindow_Previews: PreviewProvider {
    static var previews: some View {
        BottomWindow()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}


