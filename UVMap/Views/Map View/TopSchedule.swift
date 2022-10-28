//
//  topSchedule.swift
//  UVMap
//
//  Created by Ty Allembert on 10/28/22.
//

import SwiftUI

struct TopSchedule: View {
    @EnvironmentObject var classManager: ClassManager
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach((1...5), id: \.self) { course in
                    Spacer()
                    HStack(alignment: .center) {
                        Text("Cohen")
                        Text("8:30")
                            .font(.system(size: 13))
                    }
                    Spacer()
                }
                ForEach(classManager.todaysClasses, id: \.self.CRN) { course in
                    Spacer()
                    Text("Example")
                    Spacer()
                }
            }
        }
    }
}

struct TopSchedule_Previews: PreviewProvider {
    static var previews: some View {
        TopSchedule()
            .environmentObject(ClassManager())
    }
}
