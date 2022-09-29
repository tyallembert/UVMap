//
//  BottomWindowMinimized.swift
//  UVMap
//
//  Created by Ty Allembert on 9/29/22.
//

import SwiftUI

struct BottomWindowMinimized: View {
    var body: some View {
        HStack {
            ClassBuilding()
                .frame(width: UIScreen.main.bounds.width*0.45)
            StartButton()
                .frame(width: UIScreen.main.bounds.width*0.45)
        }
        .background()
    }
}

struct BottomWindowMinimized_Previews: PreviewProvider {
    static var previews: some View {
        BottomWindowMinimized()
    }
}
