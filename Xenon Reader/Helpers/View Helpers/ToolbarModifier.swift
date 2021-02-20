//
//  ToolbarModifier.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

struct ToolbarModifier: ViewModifier {
    @AppStorage("libraryViewType") var viewType: Int = 0

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem {
                    // TODO: Make picker control grid/list view
                    Picker(selection: $viewType, label: Text("Grid or list view?")) {
                        Image(systemName: "square.grid.3x2")
                            .tag(0)
                        Image(systemName: "tablecells")
                            .tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                ToolbarItem {
                    Button(action: {
                        print("New files")
                    }) {
                        Image(systemName: "scanner")
                    }
                }

                ToolbarItem {
                    Button(action: {
                        print("Search")
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
    }
}
