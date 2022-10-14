//
//  AddClassView.swift
//  UVMap
//
//  Created by Ty Allembert on 10/13/22.
//

import SwiftUI

struct AddClassView: View {
    @State var classSearch: String = ""
    var body: some View {
        VStack {
            ClassSearchBar()
        }
    }
}

struct AddClassView_Previews: PreviewProvider {
    static var previews: some View {
        AddClassView()
    }
}
