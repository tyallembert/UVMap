//
//  WalkBikeOption.swift
//  UVMap
//
//  Created by Ty Allembert on 9/28/22.
//

import SwiftUI

struct WalkBikeOption: View {
    @EnvironmentObject var mapManager : MapManager
    @State var userWalking: Bool = true
    var body: some View {
        ZStack {
            VStack (){
                ZStack {
                    Capsule()
                        .frame(width:90,height:44)
                        .foregroundColor(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
                    ZStack{
                        Circle()
                            .frame(width:40, height:40)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.50), radius: 4, x: 0, y: 0)
                            .offset(x: userWalking ? -25: 25)
                        //image in the circle
                        Image(systemName: "figure.walk")
                            .foregroundColor(userWalking ? Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255): .white)
                            .offset(x: -25)
                        // image outside of the circle
                        Image(systemName: "bicycle")
                            .foregroundColor(userWalking ? .white: Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
                            .offset(x: 25)
                    }
                    .padding(24)
                }
                .onTapGesture {
                    self.userWalking.toggle()
                    mapManager.userWalking = userWalking
                }
                .onAppear {
                    mapManager.userWalking = userWalking
                }
            }
        }
        .animation(.default)
    }
}

struct WalkBikeOption_Previews: PreviewProvider {
    static var previews: some View {
        WalkBikeOption()
    }
}
