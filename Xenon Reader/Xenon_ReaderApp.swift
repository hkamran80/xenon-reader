//
//  Xenon_ReaderApp.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

@main
struct Xenon_ReaderApp: App {
    @AppStorage("libraryViewType") var viewType: ViewTypes = .grid
    @AppStorage("librarySortType") var librarySort: LibrarySortTypes = .title
    @AppStorage("libraryPath") var libraryPath = ""
    @AppStorage("libraryUrl") var libraryUrl = ""
    @StateObject var xrShared = XRShared()
    
    @State private var categoryCreationSheet: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: LibraryLoader(libraryPath: libraryPath, libraryUrl: libraryUrl, xrShared: self.xrShared).scanFiles)
                .environmentObject(self.xrShared)
        }
        .commands {
            CommandGroup(before: .newItem) {
                // TODO: Add keyboard shortcut
                // TODO: Fix sheet
                Button(action: {
                    print("New category")
                }) {
                    Text("New Category")
                }
                .sheet(isPresented: $categoryCreationSheet) {
                    NewCategorySheet(isPresented: $categoryCreationSheet)
                }
                
            }

            CommandGroup(after: .newItem) {
                Divider()

                Button(action: LibraryLoader(libraryPath: libraryPath, libraryUrl: libraryUrl, xrShared: self.xrShared).scanFiles) {
                    Text("Scan")
                }
                .keyboardShortcut("R", modifiers: .command)
            }

            CommandGroup(after: .sidebar) {
                Picker("Library View", selection: $viewType) {
                    Label("Grid", systemImage: "square.grid.3x2")
                        .tag(ViewTypes.grid)
                    Label("List", systemImage: "tablecells")
                        .tag(ViewTypes.list)
                }

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

                Divider()

                Button(action: toggleSidebar) {
                    Text("Toggle Sidebar")
                }
                .keyboardShortcut("S", modifiers: [.command, .shift])
            }
        }

        #if os(macOS)
            Settings {
                SettingsView()
            }
        #endif
    }
}
