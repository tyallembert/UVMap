//
//  SearchBar.swift
//  UVMap
//
//  Created by Ty Allembert on 9/26/22.
//

import SwiftUI

struct SearchBar: View {
    @EnvironmentObject var mapManager : MapManager
    @State var search: String = ""
    
    var body: some View {
        HStack {
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search for a building", text: $mapManager.searchText)
                    .onChange(of: mapManager.searchText) {_ in
                        mapManager.filterBuildings()
                    }
                    .onTapGesture {
                        withAnimation{
                            mapManager.searchActive = true
                        }
                    }
                    .disableAutocorrection(true)
            }
            
            .padding(7)
            .backgroundBlur(radius: 25, opaque: true)
            .background(Color.bottomSheetBackground)
            .innerShadow(shape: RoundedRectangle(cornerRadius: 100), color: Color.innerShadow, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 0.7)
            .cornerRadius(100)
            .shadow(radius: 5)
            if mapManager.searchActive {
                Button{
                    withAnimation{
                        mapManager.searchActive = false
                        hideKeyboard()
                    }
                }label: {
                    Text("Done")
                        .foregroundColor(Color.textGreenWhite)
                }
            }
        }
        .padding()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
