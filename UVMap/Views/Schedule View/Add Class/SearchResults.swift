//
//  SearchResults.swift
//  UVMap
//
//  Created by Ty Allembert on 10/18/22.
//

import SwiftUI

struct SearchResults: View {
    @EnvironmentObject var classManager: ClassManager
    var body: some View {
        VStack {
            ClassSearchBar()
                .padding()
                .environmentObject(classManager)
            ScrollView {
                LazyVStack {
                    ForEach(classManager.searchResults, id: \.self.CRN) { course in
                        OneSearchResult()
                            .environmentObject(course)
                            .environmentObject(classManager)
                        Divider()
                    }
                }
            }
            .frame(height: classManager.searchActive ? 250: 0)
            .backgroundBlur(radius: 15, opaque: true)
            .background(Color.white.opacity(0.4))
            .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: Color.innerShadow, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 2, blendMode: .overlay, opacity: 0.7)
            .cornerRadius(10)
            .offset(y: -5)
            .shadow(color: .black.opacity(0.3),radius: 7)
            .onAppear{
                classManager.filterClasses()
            }
        }
        .padding()
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults()
            .environmentObject(ClassManager())
    }
}
