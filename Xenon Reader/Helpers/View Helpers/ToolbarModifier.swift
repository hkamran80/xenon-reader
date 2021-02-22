//
//  ToolbarModifier.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

struct ToolbarModifier: ViewModifier {
    @AppStorage("libraryViewType") var viewType: ViewTypes = .grid
    @AppStorage("librarySortType") var librarySort: LibrarySortTypes = .title
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
                    Picker("Library Sort", selection: $librarySort) {
                        Label("Title", systemImage: "textformat")
                            .tag(LibrarySortTypes.title)
                        Label("Title (Reversed)", systemImage: "textformat")
                            .tag(LibrarySortTypes.titleReversed)

                        Label("Author", systemImage: "person.3")
                            .tag(LibrarySortTypes.author)
                        Label("Author (Reversed)", systemImage: "person.3")
                            .tag(LibrarySortTypes.authorReversed)

                        Label("Publisher", systemImage: "rectangle.stack.person.crop")
                            .tag(LibrarySortTypes.publisher)
                        Label("Publisher (Reversed)", systemImage: "rectangle.stack.person.crop")
                            .tag(LibrarySortTypes.publisherReversed)

                        Label("Date Added", systemImage: "calendar.badge.plus")
                            .tag(LibrarySortTypes.dateAdded)
                        Label("Last Viewed", systemImage: "eyeglasses")
                            .tag(LibrarySortTypes.lastViewed)
                    }
                }

                ToolbarItem {
                    Picker("Library View", selection: $viewType) {
                        Label("Grid", systemImage: "square.grid.3x2")
                            .tag(ViewTypes.grid)
                        Label("List", systemImage: "tablecells")
                            .tag(ViewTypes.list)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                // TODO: Add keyboard shortcuts (Cmd+R and Slash) for scanning and searching respectively
                ToolbarItem {
                    Button(action: LibraryLoader(libraryPath: libraryPath, libraryUrl: libraryUrl, xrShared: self.xrShared).scanFiles) {
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
