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
                NavigationLink(destination: ScheduleView(), tag: 1, selection: $classManager.submitClicked) {
                    EmptyView()
                }
                SearchResults()
                    .environmentObject(classManager)
                ClassesToBeAdded()
                    .environmentObject(classManager)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            VStack {
                Spacer()
                AddClassSubmit()
                    .environmentObject(classManager)
                    .padding(.bottom, 100)
            }
        }
        .onAppear{
            classManager.studentsClasses = classManager.retrieveStudentsClassses()
            classManager.submitClicked = 0
        }
    }
}

struct AddClassView_Previews: PreviewProvider {
    static var previews: some View {
        AddClassView()
    }
}
