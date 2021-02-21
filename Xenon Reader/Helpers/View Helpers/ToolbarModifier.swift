//
//  ToolbarModifier.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

struct ToolbarModifier: ViewModifier {
    @AppStorage("libraryViewType") var viewType: ViewTypes = .grid
    @AppStorage("libraryPath") var libraryPath = ""
    @AppStorage("libraryUrl") var libraryUrl = ""
    @State var xrShared: XRShared

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar) {
                        Image(systemName: "sidebar.left")
                    }
                }

                ToolbarItem {
                    // TODO: Make picker control grid/list view
                    Picker(selection: $viewType, label: Text("Grid or list view?")) {
                        Image(systemName: "square.grid.3x2")
                            .tag(ViewTypes.grid)
                        Image(systemName: "tablecells")
                            .tag(ViewTypes.list)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                // TODO: Add keyboard shortcuts (Cmd+R and Slash) for scanning and searching respectively
                ToolbarItem {
                    Button(action: {
                        self.xrShared.fileList = retrieveDirectoryList(libraryPath: libraryPath, showHidden: false, fileExtension: "epub") ?? []
                        self.xrShared.epubs = loadLibraryItems(libraryUrl: libraryUrl, directoryList: self.xrShared.fileList)
                    }) {
                        Image(systemName: "scanner")
                    }
                }

                ToolbarItem {
                    Button(action: {
                        print("Searching...")
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
    }
}
