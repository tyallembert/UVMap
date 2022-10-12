//
//  HowEarlyDropDown.swift
//  UVMap
//
//  Created by user227524 on 10/11/22.
//

import SwiftUI

struct HowEarlyDropDown: View {
    
    var howEarly: Int = 10
    
    var body: some View {
        HStack {
            Text("\(howEarly) min")
                .foregroundColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255).opacity(0.8))
        }.padding()
            .background(.white)
            .frame(width:150, height: 50)
    }
}

struct HowEarlyDropDown_Previews: PreviewProvider {
    static var previews: some View {
        HowEarlyDropDown()
    }
}
