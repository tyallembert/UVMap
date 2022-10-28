//
//  ThemePicker.swift
//  UVMap
//
//  Created by user227524 on 10/13/22.
//

import Foundation
import SwiftUI

struct ThemePicker: View{
    @State var theme = 1
    
    var body: some View {
        VStack {
            Picker(selection: $theme, label: Text("Theme")) {
                Text("System Default").tag(1)
                Text("Dark Mode").tag(2)
                Text("Light Mode").tag(3)
            }.accentColor(.white).padding().frame(width:200)        }.background(Color("AccentColor")).cornerRadius(25)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker()
    }
}
