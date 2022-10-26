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
        ZStack {
            VStack(spacing: 0) {
                SearchResults()
                    .environmentObject(classManager)
                ClassesToBeAdded()
                    .environmentObject(classManager)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            VStack {
                Spacer()
                Button{
                    let _ = print(classManager.allClasses.count)
                }label: {
                    Text("Click for class count")
                }
                AddClassSubmit()
                    .environmentObject(classManager)
                    .padding(.bottom, 100)
            }
        }
        .onAppear{
            classManager.studentsClasses = classManager.retrieveClasssesLocally(fileName: "userClasses")
            classManager.allClasses = classManager.retrieveClasssesLocally(fileName: "all_classes")
            classManager.submitClicked = 0
        }
    }
}

struct AddClassView_Previews: PreviewProvider {
    static var previews: some View {
        AddClassView()
    }
}
