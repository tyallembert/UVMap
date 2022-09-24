//
//  InnerBox.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI

struct InnerBox: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{//inner box
            VStack(alignment: .leading) {
                Text("NETID")
                    .fontWeight(.medium)
                    .offset(x: 8, y: 12)
                    .foregroundColor(Color(red: 63 / 255, green: 98 / 255, blue: 59 / 255))
                TextField("", text: $username)
                    .padding(7)
                    .background(Color.white)
                    .cornerRadius(100)
                    .shadow(color: .black, radius: 3, x: 1, y: 2)
            }
            Spacer()
                .frame(height: 20)
            VStack(alignment: .leading) {
                Text("PASSWORD")
                    .fontWeight(.medium)
                    .offset(x: 8, y: 12)
                    .foregroundColor(Color(red: 63 / 255, green: 98 / 255, blue: 59 / 255))
                TextField("", text: $password)
                    .padding(7)
                    .background(Color.white)
                    .cornerRadius(100)
                    .shadow(color: .black, radius: 3, x: 1, y: 2)
            }
            Spacer()
                .frame(height: 20)
            Button {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }label: {
                Text("Login")
                    .font(.title2)
                    .fontWeight(.heavy)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 200)
            .background(Color(red: 63 / 255, green: 98 / 255, blue: 59 / 255))
            .cornerRadius(10)
            .shadow(color: .black, radius: 3, x: 2, y: 3)

        }
        .padding(20)
        .frame(height: 350)
        .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
        .cornerRadius(25)
    }
}

struct InnerBox_Previews: PreviewProvider {
    static var previews: some View {
        InnerBox()
    }
}
