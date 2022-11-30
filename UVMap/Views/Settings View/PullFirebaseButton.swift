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
        Button{
            ensuringUpdate = true
//            Text(ensuringUpdate ? "Sorry, too late." : "Please enter above.")
//            .onAppear(perform: updateClasses)
        } label: {
            Label("Update Classes", systemImage: "tray.and.arrow.down.fill")
        }
        .alert("Classes Updated Successfully", isPresented: $ensuringUpdate, actions: { })
        .padding()
            .backgroundBlur(radius: 25, opaque: true)
            .background(Color.backgroundGreen)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 5)
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
