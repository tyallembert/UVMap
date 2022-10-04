//
//  TripInformation.swift
//  UVMap
//
//  Created by Ty Allembert on 9/29/22.
//

import SwiftUI

struct TripInformation: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("12 min")
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .offset(x: 30)
                    Spacer()
                    Text("0.5 mi")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .offset(x: -30)
                }
                .padding()
                .background(Color("BG2"))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.30), radius: 5, x: 0, y: 0)
                HStack {
                    VStack {
                        Text("Suggested Leave Time")
                        Text("8:08am")
                            .font(.system(size: 25))
                            .fontWeight(.heavy)
                    }
                    .padding()
                    .frame(width: geometry.size.width * 0.42)
                    .background(Color("BG2"))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.30), radius: 5, x: 0, y: 0)
                    Spacer()
                    VStack {
                        Text("Arrival Time if you leave now")
                        Text("7:58am")
                            .font(.system(size: 25))
                            .fontWeight(.heavy)
                    }
                    .padding()
                    .frame(width: geometry.size.width * 0.42)
                    .background(Color("BG2"))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.30), radius: 5, x: 0, y: 0)
//                    .shadow(.inner(color: Color.black.opacity(0.30), radius: 5, x: 0, y: 0))
                }
            }
            .padding()
        }
        .frame(height: 200, alignment: .bottom)
    }
}

struct TripInformation_Previews: PreviewProvider {
    static var previews: some View {
        TripInformation()
    }
}
