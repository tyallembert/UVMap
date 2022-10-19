//
//  SearchResults.swift
//  UVMap
//
//  Created by Ty Allembert on 10/18/22.
//

import SwiftUI

struct SearchResults: View {
    @EnvironmentObject var classManager: ClassManager
    @State var searchActive: Bool = false
    var body: some View {
        VStack {
            ClassSearchBar(searchActive: $searchActive)
                .padding()
                .environmentObject(classManager)
            ScrollView {
                ForEach(classManager.searchResults, id: \.self.CRN) { course in
                    OneSearchResult()
                        .environmentObject(course)
                        .environmentObject(classManager)
                    Divider()
                }
            }
            .frame(height: searchActive ? 250: 0)
                .cornerRadius(10)
                .backgroundBlur(radius: 15, opaque: true)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(radius: 3)
                }
                .offset(y: -5)
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
