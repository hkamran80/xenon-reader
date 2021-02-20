//
//  ContentView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import EPUBKit
import SwiftUI

struct ContentView: View {
    @AppStorage("libraryPath") var libraryPath = ""
    @StateObject var xrShared = XRShared()

    // TODO: Remove variable after UI works
    let title: String

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Library")) {
                    NavigationLink(destination: GridView(epubs: self.xrShared.epubs)) {
                        Label("All Books", systemImage: "books.vertical")
                    }
                    NavigationLink(destination: AuthorsView()) {
                        Label("Authors", systemImage: "person.3")
                    }
                }

                Section(header: Text("Categories")) {
                    NavigationLink(destination: Text("Category 1")) {
                        Label("First Category", systemImage: "tray.circle")
                    }
                }

                Spacer()

                Section(header: Text("Testing")) {
                    NavigationLink(
                        destination: FileListView()
                            .environmentObject(self.xrShared)) {
                            Label("File List View", systemImage: "doc")
                    }
                }
            }
            .listStyle(SidebarListStyle())

            GridView(epubs: self.xrShared.epubs)
        }
        // TODO: Replace navigationTitle with string
        .navigationTitle(title)
        .navigationSubtitle(readableCount(count: self.xrShared.epubs.count))
        .frame(minWidth: 350, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
        .modifier(ToolbarModifier())
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(title: "Xenon Reader [Preview]")
    }
}
#endif
