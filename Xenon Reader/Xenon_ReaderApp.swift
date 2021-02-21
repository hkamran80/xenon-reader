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
    @AppStorage("libraryPath") var libraryPath = ""
    @AppStorage("libraryUrl") var libraryUrl = ""
    @StateObject var xrShared = XRShared()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    self.xrShared.fileList = retrieveDirectoryList(libraryPath: libraryPath, showHidden: false, fileExtension: "epub") ?? []
                    self.xrShared.epubs = loadLibraryItems(libraryUrl: libraryUrl, directoryList: self.xrShared.fileList)
                })
                .environmentObject(self.xrShared)
        }
        .commands {
            CommandGroup(before: .newItem) {
                // TODO: Add keyboard shortcut
                Button(action: {
                    print("New category")
                }) {
                    Text("New Category")
                }
            }

            CommandGroup(after: .newItem) {
                Divider()

                Button(action: {
                    // TODO: Figure out a way of calling this via a function, not redeclaring it every time
                    self.xrShared.fileList = retrieveDirectoryList(libraryPath: libraryPath, showHidden: false, fileExtension: "epub") ?? []
                    self.xrShared.epubs = loadLibraryItems(libraryUrl: libraryUrl, directoryList: self.xrShared.fileList)
                }) {
                    Text("Scan")
                }
                .keyboardShortcut("R", modifiers: .command)
            }

            CommandGroup(after: .sidebar) {
                Button(action: toggleSidebar) {
                    Text("Toggle Sidebar")
                }
                .keyboardShortcut("S", modifiers: [.command, .shift])

                Picker(selection: $viewType, label: Text("Library View")) {
                    Text("Grid").tag(ViewTypes.grid)
                    Text("List").tag(ViewTypes.list)
                }
            }
        }

        #if os(macOS)
            Settings {
                SettingsView()
            }
        #endif
    }
}
