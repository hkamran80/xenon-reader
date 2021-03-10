//
//  VariablesView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/20/21.
//

import SwiftUI

struct VariablesView: View {
    @AppStorage("libraryPath") var libraryPath = ""
    @AppStorage("libraryUrl") var libraryUrl = ""
    @AppStorage("libraryViewType") var viewType: LibraryViewTypes = .grid
    @AppStorage("librarySortType") var librarySort: LibrarySortTypes = .title
    @AppStorage("fontSize") var fontSize = 12.0

    var body: some View {
        List {
            Section(header: Text("Library")) {
                Text("Library Path: \(libraryPath)")
                Text("Library URL: \(libraryUrl)")
                Text("Library View Type: \(viewType == .grid ? "Grid" : "List")")
                Text("Library Sort Type: \(librarySort.rawValue)")
            }

            Section(header: Text("Reader")) {
                Text("Font Size: \(fontSize) pts")
            }
        }
    }
}

#if DEBUG
struct VariablesView_Previews: PreviewProvider {
    static var previews: some View {
        VariablesView()
    }
}
#endif
