//
//  TitleBar.swift
//  UVMap
//
//  Created by user227524 on 10/12/22.
//

import Foundation
import SwiftUI

struct TitleBar: View {
    var body: some View {
        VStack {
            Text("Settings")
                .foregroundColor(.white)
                .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255).opacity(0.8))
        }
    }
}
