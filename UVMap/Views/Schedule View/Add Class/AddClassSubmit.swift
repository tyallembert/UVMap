//
//  AddClassSubmit.swift
//  UVMap
//
//  Created by Ty Allembert on 10/19/22.
//

import SwiftUI

struct AddClassSubmit: View {
    @EnvironmentObject var classManager: ClassManager
    @EnvironmentObject var sessionManager: SessionManager
    var body: some View {
        Button {
            classManager.saveClassesLocally()
            sessionManager.selectedNavElement = 0
        }label: {
            Text("Update Schedule")
                .font(.title2)
                .fontWeight(.heavy)
        }
        .foregroundColor(.white)
        .padding()
        .background(Color(red: 41 / 255, green: 97 / 255, blue: 54 / 255))
        .cornerRadius(10)
        .shadow(color: .black, radius: 3, x: 2, y: 3)
    }
}

struct AddClassSubmit_Previews: PreviewProvider {
    static var previews: some View {
        AddClassSubmit()
    }
}
