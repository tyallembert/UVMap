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
        VStack{
            HStack {
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                Spacer()
                    
            }
            .background(Color.backgroundGreen.opacity(0.8))
        }
    }
}

struct TitleBar_previews: PreviewProvider {
    static var previews: some View {
        TitleBar()
    }
}
