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
            NextClass()
            ClassTime()
            HStack {
                ClassBuilding()
            }
        }
    }
}

struct BottomWindow_Previews: PreviewProvider {
    static var previews: some View {
        BottomWindow()
    }
}
