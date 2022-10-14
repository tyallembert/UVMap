//
//  ClassSearchBar.swift
//  UVMap
//
//  Created by Ty Allembert on 10/13/22.
//

import SwiftUI

struct ClassSearchBar: View {
    @State var classSearch: String = ""
    var body: some View {
        ZStack {
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search for class", text: $classSearch)
            }
            .padding(7)
            .backgroundBlur(radius: 25, opaque: true)
            .background(Color.white.opacity(0.4))
            .innerShadow(shape: RoundedRectangle(cornerRadius: 100), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 0.7)
            .cornerRadius(100)
            .shadow(radius: 5)
        }
        .padding()
    }
}

struct ClassSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ClassSearchBar()
    }
}
