//
//  SearchBar.swift
//  UVMap
//
//  Created by Ty Allembert on 9/26/22.
//

import SwiftUI

struct SearchBar: View {
    @State var search: String = ""
    
    var body: some View {
        HStack {
            TextField("Search for a building", text: $search)
                .padding(7)
                .background(Color.white)
                .cornerRadius(100)
                .shadow(color: .black, radius: 3, x: 1, y: 2)
            Image(systemName: "magnifyingglass")
                .offset(x: -40)
        }
        .padding()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
