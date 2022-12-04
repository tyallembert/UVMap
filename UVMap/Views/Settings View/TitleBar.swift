//
//  TitleBar.swift
//  UVMap
//
//  Created by user227524 on 10/12/22.
//

import Foundation
import SwiftUI

// the view for the top bar
struct TitleBar: View {
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Spacer()
                    .frame(width: 15)
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .bold))
                    .shadow(radius: 5, x: 5, y: 10)
                Spacer()
                saveButton()
                    .padding()
                    .font(.title3)
                    
            }
        }
        .background(Color.backgroundGreen)
    }
}

struct TitleBar_previews: PreviewProvider {
    static var previews: some View {
        TitleBar()
    }
}
