//
//  BuildingAnnotation.swift
//  UVMap
//
//  Created by Ty Allembert on 10/10/22.
//

import SwiftUI

struct BuildingAnnotation: View {
    let gradientWithFourColors = Gradient(colors: [
        Color("AccentColor"),
        Color(red: 250, green: 250, blue: 250)
        ]
    )

    var body: some View {
        ZStack {
            Circle()
                .fill(RadialGradient(gradient: gradientWithFourColors, center: .center, startRadius: 10, endRadius: 55))
                .frame(width: 30, height: 30)
            Image(systemName: "graduationcap.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
        }
        .shadow(radius: 3, y: 3)
    }
}

struct BuildingAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        BuildingAnnotation()
    }
}
