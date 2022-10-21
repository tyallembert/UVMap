//
//  ClassesToBeAdded.swift
//  UVMap
//
//  Created by Ty Allembert on 10/17/22.
//

import SwiftUI

struct ClassesToBeAdded: View {
    @EnvironmentObject var classManager: ClassManager
    var body: some View {
        VStack {
            Text("Selected Classes")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView {
                if classManager.classesToBeAdded.isEmpty{
                    Text("Search for a class")
                        .foregroundColor(Color.gray)
                }else{
                    ForEach(classManager.classesToBeAdded, id: \.self.CRN) { course in
                        AddOneClass()
                            .environmentObject(course)
                            .environmentObject(classManager)
                        Divider()
                    }
                }
            }
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
            .cornerRadius(10)
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 230/255, green: 230/255, blue: 230/255))
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct ClassesToBeAdded_Previews: PreviewProvider {
    static var previews: some View {
        ClassesToBeAdded()
            .environmentObject(ClassManager())
    }
}
