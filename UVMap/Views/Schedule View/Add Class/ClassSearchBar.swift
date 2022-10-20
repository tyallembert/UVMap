//
//  ClassSearchBar.swift
//  UVMap
//
//  Created by Ty Allembert on 10/13/22.
//

import SwiftUI

struct ClassSearchBar: View {
    @EnvironmentObject var classManager: ClassManager
    @Binding var searchActive: Bool
    var body: some View {
        HStack {
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search for class", text: $classManager.searchText)
                    .onChange(of: classManager.searchText) {_ in
                        classManager.filterClasses()
                    }
                    .onTapGesture {
                        withAnimation{
                            searchActive = true
                        }
                    }
            }
                .padding(7)
                .backgroundBlur(radius: 25, opaque: true)
                .background(Color.white.opacity(0.4))
                .innerShadow(shape: RoundedRectangle(cornerRadius: 100), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 0.7)
                .cornerRadius(100)
                .shadow(radius: 5)
            if searchActive {
                Button{
                    withAnimation{
                        searchActive = false
                        hideKeyboard()
                    }
                }label: {
                    Text("Cancel")
                }
            }
        }
    }
}

struct ClassSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ClassSearchBar(searchActive: .constant(false))
    }
}
