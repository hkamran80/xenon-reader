//
//  VariablesView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/20/21.
//

import SwiftUI

struct VariablesView: View {
    @AppStorage("fontSize") var fontSize = 12.0
    @AppStorage("libraryViewType") var viewType: ViewTypes = .grid
    @AppStorage("libraryPath") var libraryPath = ""
    @AppStorage("libraryUrl") var libraryUrl = ""
    
    var body: some View {
        List {
            Text("Font Size: \(fontSize) pts")
            Text("Library View Type: \(viewType == .grid ? "Grid" : "List")")
            Text("Library Path: \(libraryPath)")
            Text("Library URL: \(libraryUrl)")
        }
    }
}

struct VariablesView_Previews: PreviewProvider {
    static var previews: some View {
        VariablesView()
    }
}
