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
    @State var epub: EPUBDocument?

    var epubs: [EPUBDocument?] = [loadEpub("Genius - Genius_ The Game (Book 1) - Leopoldo Gout")]

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: GridView(epubs: epubs)) {
                    Label("Library", systemImage: "books.vertical")
                }

                Divider()

                Text("Categories")
                    .opacity(0.5)
                Group {
                    NavigationLink(destination: Text("Category 1")) {
                        Label("First Category", systemImage: "folder.circle")
                    }
                }
            }
            .listStyle(SidebarListStyle())

            GridView(epubs: epubs)
        }
        .navigationTitle("Xenon Reader")
        .navigationSubtitle("1 Readable")
        .frame(minWidth: 700, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
        .modifier(ToolbarModifier())
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
