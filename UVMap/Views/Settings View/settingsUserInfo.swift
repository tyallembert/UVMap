//
//  settingsUserInfo.swift
//  UVMap
//
//  Created by Ty Allembert on 12/1/22.
//

import SwiftUI

struct settingsUserInfo: View {
    @EnvironmentObject var sessionManager: SessionManager
    var body: some View {
        VStack {
            Image(systemName: "person")
                .font(.system(size: 60, weight: .light))
                .foregroundColor(Color.textGreenWhite)
                .padding()
                .background{
                    Circle()
                        .stroke(Color.textGreenWhite, lineWidth: 3)
                        .backgroundBlur(radius: 20, opaque: false)
                }
            Text("John")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(Color.textGreenWhite)
            Text("Doe")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.textGreenWhite)
            Text("netid@uvm.edu")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Color.textGreenWhite)
        }
        .frame(maxWidth: .infinity)
        .padding(30)
        .overlay{
            Rectangle()
                .fill(Color.uvmGreen)
                .frame(width: 250, height: 20, alignment: .top)
                .rotationEffect(.degrees(45))
                .offset(x: UIScreen.main.bounds.width/3, y: -100)
            Rectangle()
                .fill(Color.uvmGreen)
                .frame(width: 250, height: 5, alignment: .top)
                .rotationEffect(.degrees(45))
                .offset(x: UIScreen.main.bounds.width/3, y: -50)
            Rectangle()
                .fill(Color.uvmGreen)
                .frame(width: 250, height: 2, alignment: .top)
                .rotationEffect(.degrees(45))
                .offset(x: UIScreen.main.bounds.width/3, y: -60)
        }
        .background{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.backgroundGradient)
                .padding(3)
        }
        .clipped()
    }
}

struct settingsUserInfo_Previews: PreviewProvider {
    static var previews: some View {
        settingsUserInfo()
    }
}
