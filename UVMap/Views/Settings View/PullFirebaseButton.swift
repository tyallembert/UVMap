//
//  PullFirebaseButton.swift
//  UVMap
//
//  Created by nate lalor on 11/30/22.
//

import SwiftUI

struct PullFirebaseButton: View {
    
    @State private var ensuringUpdate = false
    var body: some View {
        HStack {
            Button{
                ensuringUpdate = true
    //            Text(ensuringUpdate ? "Sorry, too late." : "Please enter above.")
    //            .onAppear(perform: updateClasses)
            } label: {
                Label("Update Classes", systemImage: "arrow.triangle.2.circlepath")
                    .font(.system(size: 15))
            }
                .alert("Classes Updated Successfully", isPresented: $ensuringUpdate, actions: { })
                .padding(.top, 20)
                .padding(.bottom, 20)
                .frame(width: UIScreen.main.bounds.width/2.4)
                .backgroundBlur(radius: 25, opaque: true)
                .background(Color.backgroundGreen)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 3, y: 3)
            Button{
                ensuringUpdate = true
    //            Text(ensuringUpdate ? "Sorry, too late." : "Please enter above.")
    //            .onAppear(perform: updateClasses)
            } label: {
                Label("Update Buildings", systemImage: "building.fill")
                    .font(.system(size: 15))
            }
                .alert("Buildings Updated Successfully", isPresented: $ensuringUpdate, actions: { })
                .padding(.top, 20)
                .padding(.bottom, 20)
                .frame(width: UIScreen.main.bounds.width/2.4)
                .backgroundBlur(radius: 25, opaque: true)
                .background(Color.backgroundGreen)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 3, y: 3)
        }
//        .frame(maxWidth: .infinity)
    }
               
               
    private func updateClasses() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                ensuringUpdate = true
            }
        
        }
        
}

struct PullFirebaseButton_Previews: PreviewProvider {
    static var previews: some View {
        PullFirebaseButton()
    }
}
