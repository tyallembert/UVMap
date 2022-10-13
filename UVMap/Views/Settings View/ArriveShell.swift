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
        HStack(spacing: 0){
            //arrive text
            Text("Arrive")
                .foregroundColor(.white)
                .font(.body)
            HowEarlyDropDown()
            Text("min before class starts")
                .foregroundColor(.white)
                .font(.body)
            //before class starts text
        }.padding()
            .frame(width: 375, height: 50, alignment: .leading)
            .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255).opacity(0.8))
            .cornerRadius(50)
    }
}

struct ArriveShell_Previews: PreviewProvider {
    static var previews: some View {
        ArriveShell()
    }
}
