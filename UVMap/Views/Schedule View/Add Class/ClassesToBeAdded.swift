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
                .foregroundColor(Color.textGreenWhite)
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView {
                if classManager.studentsClasses.isEmpty{
                    Text("Search for a class")
                        .foregroundColor(Color.textBlackWhite.opacity(0.7))
                }else{
                    ForEach(classManager.studentsClasses, id: \.self.CRN) { course in
                        AddOneClass()
                            .padding(5)
                            .environmentObject(course)
                            .environmentObject(classManager)
                        Divider()
                    }
                }
            }
            .frame(maxWidth: .infinity, minHeight: 100)
            .padding()
            .backgroundBlur(radius: 25, opaque: true)
            .background(Color.white.opacity(0.4))
            .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: Color.innerShadow, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 2, blendMode: .overlay, opacity: 0.7)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 7)
//            .background{
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color(red: 230/255, green: 230/255, blue: 230/255))
//            }
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
