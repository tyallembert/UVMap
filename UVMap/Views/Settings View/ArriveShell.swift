//
//  ArriveShell.swift
//  UVMap
//
//  Created by user227524 on 10/12/22.
//

import Foundation
import SwiftUI

struct ArriveShell: View {
    var body: some View {
        HStack{
            //arrive text
            Text("Arrive")
                .foregroundColor(.white)
            HowEarlyDropDown()
            Text("before class starts")
                .foregroundColor(.white)
            //before class starts text
        }.padding()
            .frame(width: 375, height: 50)
            .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255).opacity(0.8))
            .cornerRadius(50)
    }
}

struct ArriveShell_Previews: PreviewProvider {
    static var previews: some View {
        ArriveShell()
    }
}
