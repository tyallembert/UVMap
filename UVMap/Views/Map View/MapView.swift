//
//  MapView.swift
//  UVMap
//
//  Created by Ty Allembert on 9/23/22.
//

import SwiftUI

struct MapView: View {
    
    @State var showingBottomWindow = true
    
    var body: some View {
        ZStack {
            TheMap()
                .onTapGesture {
                    self.showingBottomWindow = false
                }
            VStack {
                SearchBar()
                Spacer()
                if showingBottomWindow {
                    BottomWindow()
                        .cornerRadius(10)
                        .padding()
                        .background(Color.white
                                    .shadow(color: Color.black.opacity(0.30), radius: 5, x: 0, y: 0))
                        .animation(.default)
                }else{
                    BottomWindowMinimized()
                        .cornerRadius(10)
                        .padding()
                        .background(Color.white
                                    .shadow(color: Color.black.opacity(0.30), radius: 5, x: 0, y: 0))
                        .animation(.easeIn)
                        .onTapGesture {
                            self.showingBottomWindow = true
                        }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
