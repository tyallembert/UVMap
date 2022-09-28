//
//  ContentView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI

struct ContentView: View {
    @State var loggedIn: Bool = true
    
    var body: some View {
        if loggedIn {
            MainNavigation()
        }else{
            LoginView(loggedIn: $loggedIn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
