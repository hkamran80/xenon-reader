//
//  ToolbarModifier.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

struct ToolbarModifier: ViewModifier {
    @AppStorage("libraryViewType") var viewType: ViewTypes = .grid
    @State var xrShared: XRShared

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .navigation) {
                    if xrShared.mainViewType == .reader {
                        Button(action: {
                            self.xrShared.activeReadable = nil
                            self.xrShared.mainViewType = .library
                        }) {
                            Image(systemName: "chevron.left")
                        }
                    }
                    
                    Button(action: toggleSidebar) {
                        Image(systemName: "sidebar.left")
                            .help("Toggle Sidebar")
                    }
                }

                ToolbarItemGroup {
                    if xrShared.mainViewType == .library {
                        Picker("Library View", selection: $viewType) {
                            Label("Grid", systemImage: "square.grid.3x2")
                                .tag(ViewTypes.grid)
                            Label("List", systemImage: "tablecells")
                                .tag(ViewTypes.list)
                        }
                        .pickerStyle(SegmentedPickerStyle())

                        // TODO: Add keyboard shortcut (slash) for searching
                        Button(action: {
                            print("Searching...")
                        }) {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
            }
    }
}
