//
//  BottomWindow.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct BottomWindow: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        ClassBuilding()
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
    }
}

struct BottomWindow_Previews: PreviewProvider {
    static var previews: some View {
        BottomWindow()
    }
}


