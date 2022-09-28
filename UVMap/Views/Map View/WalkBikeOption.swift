//
//  WalkBikeOption.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct WalkBikeOption: View {
    @State var userWalking: Bool = true
    var body: some View {
        Toggle(isOn: $userWalking) {
            Text("Walk")
        }
    }
}

struct WalkBikeOption_Previews: PreviewProvider {
    static var previews: some View {
        WalkBikeOption()
    }
}
