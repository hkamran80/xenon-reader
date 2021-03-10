//
//  SidebarView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/20/21.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var xrShared: XRShared
    @State private var defaultItemActive: Bool = true

    var body: some View {
        List {
            Section(header: Text("Library")) {
                NavigationLink(destination: LibraryView(epubs: xrShared.epubs), isActive: $defaultItemActive) {
                    Label("All Books", systemImage: "books.vertical")
                }
                NavigationLink(destination: AuthorsView()) {
                    Label("Authors", systemImage: "person.3")
                }
                NavigationLink(destination: PublishersView()) {
                    Label("Publishers", systemImage: "rectangle.stack.person.crop")
                }
            }

            Section(header: Text("Categories")) {
                ForEach(self.xrShared.categories, id: \.id) { category in
                    NavigationLink(destination: Text("Planned: \(category.name)")) {
                        Label(category.name, systemImage: category.imageName)
                    }
                }
            }

            Spacer()

            Section(header: Text("Testing")) {
                NavigationLink(
                    destination: FileListView()
                        .environmentObject(self.xrShared)) {
                        Label("File List View", systemImage: "doc")
                }
                NavigationLink(destination: VariablesView()) {
                    Label("Variables", systemImage: "externaldrive.connected.to.line.below")
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}

#if DEBUG
struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
#endif
