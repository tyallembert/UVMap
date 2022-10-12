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
            .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255).opacity(0.8))
            
            Spacer()
            
        }
    }
}

struct TitleBar_previews: PreviewProvider {
    static var previews: some View {
        TitleBar()
    }
}
