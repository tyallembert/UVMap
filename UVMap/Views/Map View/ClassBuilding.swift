//
//  ClassBuilding.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct ClassBuilding: View {
    @State var classroom: String = "Cohen 120"
    var body: some View {
        Text(classroom)
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .padding()
            .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
            .cornerRadius(10)
            .shadow(color: .black, radius: 3, x: 2, y: 3)
    }
}

struct ClassBuilding_Previews: PreviewProvider {
    static var previews: some View {
        ClassBuilding()
    }
}
