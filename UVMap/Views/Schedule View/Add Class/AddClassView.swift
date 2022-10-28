//
//  AddClassView.swift
//  UVMap
//
//  Created by Ty Allembert on 10/13/22.
//

import SwiftUI

struct AddClassView: View {
    @StateObject var classManager: ClassManager = ClassManager()
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                SearchResults()
                    .environmentObject(classManager)
                ClassesToBeAdded()
                    .environmentObject(classManager)
                AddClassSubmit()
                    .environmentObject(classManager)
                    .padding(.bottom, 100)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
//            VStack {
////                Spacer()
//                AddClassSubmit()
//                    .environmentObject(classManager)
//                    .padding(.bottom, 100)
//            }
        }
        .background(Color.backgroundGradient)
        .onAppear{
            classManager.studentsClasses = classManager.retrieveClasssesLocally(fileName: "student_classes")
            classManager.allClasses = classManager.retrieveClasssesLocally(fileName: "all_classes")
            classManager.getTodaysClasses()
        }
    }
}

struct AddClassView_Previews: PreviewProvider {
    static var previews: some View {
        AddClassView()
    }
}
